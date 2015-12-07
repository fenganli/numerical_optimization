function [inform, x] = SteepDescent(func, x, sdparams)
%SteepDescent SteepDescent function
%   This is  the steep_descent function
max_iter = sdparams.maxit;
toler = sdparams.toler;
point.p = x.p;
params = struct('ftol', 1e-4, 'gtol', 0.9, 'xtol', 1e-6, 'stpmin', 0, 'stpmax', 1e20, 'maxfev', 10000);
for i = 1:max_iter
    point.g = feval(func, point.p, 2);
    point.f = feval(func, point.p, 1);
    if norm(point.g) < toler
        inform.status = 1;
        inform.iter = i;
        x.p = point.p;
        x.f= point.f;
        return;
    end
    
    [alfa, x] = StepSize(func, point, (0-point.g), 1, params);
    point.p = point.p - alfa * point.g;
end
inform.status = 0;
inform.iter = max_iter;
x.p = point.p;
x.f= point.f;
return;
end

