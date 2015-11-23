function [inform, x] = cgTrust(func, x, nparams)
%cgTrust cgTrust function
%   This is  the cgTrust function
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

% total number of conjugate iteration
cg_iter = 0;

for i = 1:max_iter
    % Computes the gradient and heissian.
    point.f = feval(func, point.p, 1);
    point.g = feval(func, point.p, 2);
    point.h = feval(func, point.p, 4);
    
    % Outputs the norm of the gradient.
    % norm(point.g)
    if norm(point.g) < toler
        inform.status = 1;
        inform.iter = i;
        inform.cg_iter = cg_iter;
        x.p = point.p;
        x.f = feval(func, point.p, 1);
        x.g = feval(func, point.p, 2);
        x.h = sparse(feval(func, point.p, 4));
        return;
    end
    
    z = zeros(size(point.h, 1), 1);
    r_0 = point.g;
    r = r_0;
    d = -r;
    k = 0;
    while 1
        if d'*point.h*d <= 0
            p = boundary(z, d, delta);
            break;
        else
            alpha = norm(r)^2/(d'*point.h*d);
            if norm(z+alpha*d) >= delta
                p = boundary(z, d, delta);
                break;
            end
        end
        z = z+alpha*d;
        r_new = r + alpha*point.h*d;
        if or(norm(r) < toler, norm(r) < toler * norm(r_0))
            p = z;
            break;
        end
        beta = norm(r_new)^2/norm(r)^2;
        d = -r_new+beta*d;
        r = r_new;
        k = k + 1;      
    end
    cg_iter = cg_iter + k;
    
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
inform.cg_iter = cg_iter;
x.p = point.p;
x.f= point.f;
x.g = feval(func, x.p, 2);
x.h = sparse(feval(func, x.p, 4));
return;
end