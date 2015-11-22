function [inform, x] = DogLeg(func, x, nparams)
%DogLeg DogLeg function
%   This is  the DogLeg function
global numf numg numH numFact
numf = 0;
numg = 0;
numH = 0;
numFact = 0;

max_iter = nparams.maxit;
toler = nparams.toler;
point.p = x.p;
% This parameter is no longer neede.
% params = struct('ftol', 1e-4, 'gtol', 0.9, 'xtol', 1e-6, 'stpmin', 0, 'stpmax', 1e20, 'maxfev', 10000);
max_delta = nparams.delbar;
init_delta = nparams.initdel;
eta = nparams.eta;

% initial the delta
delta = init_delta;

for i = 1:max_iter
    % Computes the gradient and heissian.
    point.f = feval(func, point.p, 1);
    point.g = feval(func, point.p, 2);
    point.h = sparse(feval(func, point.p, 4));
    
    % Outputs the norm of the gradient.
    % norm(point.g)
    if norm(point.g) < toler
        inform.status = 1;
        inform.iter = i;
        x.p = point.p;
        x.f = feval(func, point.p, 1);
        x.g = feval(func, point.p, 2);
        x.h = sparse(feval(func, point.p, 4));
        return;
    end
    
    % Sec 0: Calculate the Cauchy point.
    if point.g'*point.h*point.g <= 0
        tao = 1;
    else
        tao = min(norm(point.g)^3/(delta*point.g'*point.h*point.g), 1);
    end
    p_c = -tao*delta*point.g/norm(point.g);
    
    % Sec 1: Calculate the dogleg point p.
    [R, fail] = chol(point.h);
    numFact = numFact + 1;
    if fail ~= 0 && strcmp(nparams.fail, 'cauchy')
        p = p_c;
    else
        [R, tao] = Added_Cholesky(point.h);
        p_n = -R\(R'\point.g);
        % Now we calculate the dog leg point.
        a = norm(p_n-p_c)^2;
        b = 2*p_c'*(p_n-p_c);
        c = norm(p_c)^2-delta^2;
        r = (-b+sqrt(b^2-4*a*c))/(2*a);
        p = p_c + r * (p_n-p_c);
    end
    
    rho = (point.f - feval(func, point.p+p, 1))/(-point.g'*p-0.5*p'*point.h*p);
    
    % Now we update the algorithm.
    if rho < 0.25
        delta = delta/4;
    else
        if rho > 0.75 && norm(p) == delta
            delta = min(2*delta, max_delta);
        else
            delta = delta;
        end
    end
    if rho > eta
        point.p = point.p + p;
    else
        point.p = point.p;
    end
end
inform.status = 0;
inform.iter = max_iter;
x.p = point.p;
x.f= point.f;
x.g = feval(func, x.p, 2);
x.h = sparse(feval(func, x.p, 4));
return;
end

