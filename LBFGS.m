function [inform, x] = LBFGS(func, x, nparams)
%Newton Newton function
%   This is  the newton function
global numf numg numH
numf = 0;
numg = 0;
numH = 0;
max_iter = nparams.maxit;
toler = nparams.toler;
m = nparams.m;
point.p = x.p;
params = struct('ftol', 1e-4, 'gtol', 0.9, 'xtol', 1e-6, 'stpmin', 0, 'stpmax', 1e20, 'maxfev', 10000);

% Now we define the variables to store.

k_dimen = size(point.p, 1);
rho_array = zeros(1, m);
sk_array = zeros(k_dimen, m);
yk_array = zeros(k_dimen, m);
ai_array = zeros(1, m);

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
        num_iter = min(m, i-1);
        %if (num_iter == m)
            gamma_k = (sk_array(:, m-num_iter+1)'*yk_array(:,m-num_iter+1))/((yk_array(:,m-num_iter+1)'*yk_array(:,m-num_iter+1)));
        %else
        %    gamma_k = (sk_array(:, m)'*yk_array(:,m))/((yk_array(:,m)'*yk_array(:,m)));
        %end
        H_kzero = gamma_k*eye(k_dimen);
        q=point.g;
        for j=m:-1:m-num_iter+1
            ai_array(1,j) = rho_array(1,j)*sk_array(:,j)'*q;
            q = q - ai_array(1,j)*yk_array(:,j);
        end
        r = H_kzero*q;
        for j=m-num_iter+1:m
            beta = rho_array(1, j)*yk_array(:,j)'*r;
            r = r+sk_array(:, j)*(ai_array(1, j)-beta);
        end;
        s=-r;
    end
    
    % norm(s')
    % norm(point.g)
    % s'*point.g

    
    [alfa, x] = StepSizeSW(func, point, s, 1, params);
    point.p = point.p + alfa * s;
    

    % update the parameters for next iteration.
    s_k = alfa * s;
    y_k = feval(func, point.p, 2) - point.g;
    rho_k = 1/(y_k'*s_k);

    for j = 1:m-1
        rho_array(1,j) = rho_array(1,j+1);
        sk_array(:,j) = sk_array(:,j+1);
        yk_array(:,j) = yk_array(:,j+1);
    end
    rho_array(1,m) = rho_k;
    sk_array(:,m) = s_k;
    yk_array(:,m) = y_k;
end
inform.status = 0;
inform.iter = max_iter;
x.p = point.p;
x.f= point.f;
return;
end