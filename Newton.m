
function [inform, x] = Newton(func, x, nparams)
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


for i = 1:max_iter
    % Computes the gradient and heissian.
    point.f = feval(func, point.p, 1);
    point.g = feval(func, point.p, 2);
    point.h = sparse(feval(func, point.p, 4));
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
    
    % use the direct method
    if strcmp(nparams.method, 'direct')
        s = -point.h\point.g;
        % Test whether it's a descent direction or valid answer.
        % if sum(isinf(s)) | transpose(point.g)*s >= 0
        if point.g'*s >= 0
        % if transpose(point.g)*s >= 0
            %D_ii = max(max(abs(diag(point.h))), 0.01);
            %s = -D_ii*x.g;
            D=zeros(size(point.h));
            for j=1:size(point.p, 1)
                D(j,j)=1.0/max(0.01, abs(point.h(j,j)));
            end
            D
            s = -D*point.g;   
        end
    else
        % use another way
        [R, tao] = Added_Cholesky(point.h);
        s=-R\(R'\point.g);
    end
    
    [alfa, x] = StepSizeSW(func, point, s, 1, params);
    point.p = point.p + alfa * s;
end
inform.status = 0;
inform.iter = max_iter;
x.p = point.p;
x.f= point.f;
return;
end


