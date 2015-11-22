function [inform, x] = BFGS(func, x, nparams)
%Newton Newton function
%   This is  the newton function
global numf numg numH
numf = 0;
numg = 0;
numH = 0;
max_iter = nparams.maxit;
toler = nparams.toler;
point.p = x.p;
params = struct('ftol', 1e-4, 'gtol', 0.9, 'xtol', 1e-6, 'stpmin', 0, 'stpmax', 1e20, 'maxfev', 10000);

k_dimen = size(point.p, 1);
for i = 1:max_iter
    % Computes the gradient and heissian.
    point.f = feval(func, point.p, 1);
    point.g = feval(func, point.p, 2);
    % Checks for the termination condition.
    
    % Outputs the norm of the gradient.
    if norm(point.g) / min(1000, 1+abs(point.f)) < toler
        inform.status = 1;
        inform.iter = i;
        x.p = point.p;
        x.f = feval(func, point.p, 1);
            return;
    end
    
    % The first step needs special treatment
    if i == 1
        s = -point.g;
    else
        % Updates the current H.
        % size(eye(k_dimen))
        % size(rho_k*s_k*y_k')
        H_kplus1 = (eye(k_dimen)-rho_k*s_k*y_k')*H_k*(eye(k_dimen)-rho_k*y_k*s_k')+rho_k*s_k*s_k';
        s = -H_kplus1 * point.g;
    end
    
    [alfa, x] = StepSize(func, point, s, 1, params);
    point.p = point.p + alfa * s;

    % update the parameters for next iteration.
    s_k = alfa * s;
    y_k = feval(func, point.p, 2) - point.g;
    rho_k = 1/(y_k'*s_k);
    if i == 1
        H_k = (s_k'*y_k)/(y_k'*y_k) * eye(k_dimen);
    else
        H_k = H_kplus1;
    end
end
inform.status = 0;
inform.iter = max_iter;
x.p = point.p;
x.f= point.f;
return;
end
