global numf numg numH x_c A
numf = 0;
numg = 0;
numH = 0;
n=100; logcond=1;
% choose the eigenvalues of the Hessian A:
Aeig=logcond*rand(n,1); Aeig=10.^Aeig;
fprintf(1,'condition number is %6.2e\n', max(Aeig)/min(Aeig));
% generate a random orthogonal matrix
B=randn(n,n); [Q,R]=qr(B); A=Q'*diag(Aeig)*Q;
% choose center point. Objective is f(x)=(1/2)*(x-xcenter)’*A*(x-xcenter)
x_c=randn(n,1);
x = struct('p', randn(n, 1)); % initial point
x.p(x.p<0) = 0;
nparams = struct('maxit',10000,'toler',1.0e-6, 'initstep', 'adaptive', 'newton', 'no');
[inform,xnew] = p_sd(@qf, x, nparams);
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('diff between function values %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d iters taken\n\n', inform.iter);
end
fprintf('Ending number of active constraints: %d\n', sum(xnew.p<=0));
fprintf('Ending value: '); fprintf('%8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
% fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n\n',numH);
