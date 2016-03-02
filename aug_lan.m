function [ output_args ] = aug_lan(f, c, la, mu0, tao0, x0, lambda0)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
end_tolerance = 1e-8;
global lambda_k mu_k
lambda_k = lambda0;
mu_k = mu0;
tao_k = tao0;

x = struct('p',ones(2,1));
x.p = x0;

iter = 0;
while 1
    iter = iter+1
    % convergence test
    c_gradients = c(x.p, 2);
    c_size = size(c_gradients, 1);
    kkt = f(x.p, 2);
    for i = 1:c_size
        kkt = kkt - lambda_k(i) * c_gradients(i, :)';
    end
    norm(kkt)+ norm(c(x.p, 1))
    if norm(kkt) + norm(c(x.p, 1))< end_tolerance
        output_args = x.p;
        break;
    end
  
	nparams = struct('maxit',1000,'toler',tao_k,'delbar',100,'eta',0.1,'initdel',1,'method','chole','hessian','exact', 'fail', 'cauchy');

	% fprintf('objg: DogLeg, Problem size: '); fprintf('%d\n',length(x.p));
	tic, [inform,xnew] = Newton(la,x,nparams); toc,
	if inform.status == 0
		fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
		fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
	else
		fprintf('Success: %d steps taken\n\n', inform.iter);
    end
    x.p = xnew.p;
    x.p
	lambda_k = lambda_k - times(mu_k, c(x.p, 1))
    %norm(obj173(x.p, 2)-times(lambda_k, c173(x.p, 2)))
	mu_k = mu_k * 2;
	tao_k = sumabs(c(x.p, 1)) * 1e-4;
    % x.p
    % tao_k = c173(x.p, 1);
end

end

