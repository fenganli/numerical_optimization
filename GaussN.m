function [inform, x] = GaussN(func, x, nparams)
%GaussN Gaussian Newton function
%   This is  the gaussian newton function
global numf numg numH resid
numf = 0;
numg = 0;
numH = 0;
max_iter = nparams.maxit;
toler = nparams.toler;
point.p = x.p;
params = struct('ftol', 1e-4, 'gtol', 0.9, 'xtol', 1e-6, 'stpmin', 0, 'stpmax', 1e20, 'maxfev', 10000);


for i = 1:max_iter
    % Computes the gradient and heissian.
    point.f = feval(func, point.p, 1);
    point.g = feval(func, point.p, 2);
    % Checks for the termination condition.
    
    % Outputs the norm of the gradient.
    % norm(point.g)
    if norm(point.g) < toler
        inform.status = 1;
        inform.iter = i;
        x.p = point.p;
        x.f = feval(func, point.p, 1);
            return;
    end
    r = feval(resid, point.p, 1);
    J = feval(resid, point.p, 2);
    if strcmp(nparams.lsmethod, 'chol')
        [R, fail] = chol(J'*J);
        if fail > 0 
            inform.status = 0;
            inform.iter = max_iter;
            x.p = point.p;
            x.f= point.f;
            return;
        end
        s = -R\(R'\(J'*r));
    elseif strcmp(nparams.lsmethod, 'qr')
        [Q R P] = qr(J);
        n = size(J, 2);
        Q1 = Q(1:end, 1:n);
        R = R(1:n, 1:end);
        s=-P*(R\(Q1'*r));
    elseif strcmp(nparams.lsmethod, 'svd')
        [U S V] = svd(full(J));
        n = size(J, 2);
        U1 = U(1:end, 1:n);
        S = S(1:n, 1:n);
        s=-V*inv(S)*U1'*r; 
    end
    
    [alfa, x] = StepSize(func, point, s, 1, params);
    point.p = point.p + alfa * s;
end
inform.status = 0;
inform.iter = max_iter;
x.p = point.p;
x.f= point.f;
return;
end


