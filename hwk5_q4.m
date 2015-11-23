global numf numg numH numFact
global resid

x = struct('p',ones(600,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta', 0.1,'initdel',1,'method','chol','hessian','exact', 'fail', 'cauchy');


fprintf('objg: cgTrust, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = cgTrust(@objg,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n\n', inform.iter);
end
fprintf('Ending value: '); fprintf('%8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n\n',numH);
fprintf('No. Factorizations %d\n\n',numFact);


x = struct('p',ones(1000,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact', 'fail', 'cauchy');

fprintf('objg: cgTrust, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = cgTrust(@objg,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n\n', inform.iter);
end
fprintf('Ending value: '); fprintf('%8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n\n',numH);
fprintf('No. Factorizations %d\n\n',numFact);

x = struct('p',ones(2000,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact', 'fail', 'cauchy');

fprintf('objg: cgTrust, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = cgTrust(@objg,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n\n', inform.iter);
end
fprintf('Ending value: '); fprintf('%8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n\n',numH);
fprintf('No. Factorizations %d\n\n',numFact);

probname = 'geodesic';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = cgTrust(@objampl,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n\n', inform.iter);
end
fprintf('Ending value: %8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n',numH);
fprintf('No. Factorizations %d\n\n',numFact);

x = struct('p',ones(600,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta', 0.1,'initdel',1,'method','chol','hessian','exact', 'fail', 'cauchy');


fprintf('objg: TNewton, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = TNewton(@objg,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n\n', inform.iter);
end
fprintf('Ending value: '); fprintf('%8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n\n',numH);
fprintf('No. Factorizations %d\n\n',numFact);


x = struct('p',ones(1000,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact', 'fail', 'cauchy');

fprintf('objg: TNewton, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = TNewton(@objg,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n\n', inform.iter);
end
fprintf('Ending value: '); fprintf('%8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n\n',numH);
fprintf('No. Factorizations %d\n\n',numFact);

x = struct('p',ones(2000,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact', 'fail', 'cauchy');

fprintf('objg: TNewton, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = TNewton(@objg,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n\n', inform.iter);
end
fprintf('Ending value: '); fprintf('%8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n\n',numH);
fprintf('No. Factorizations %d\n\n',numFact);

probname = 'geodesic';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n\n', inform.iter);
end
fprintf('Ending value: %8.4g\n',xnew.f);
fprintf('No. function evaluations: %d\n',numf);
fprintf('No. gradient evaluations %d\n',numg);
fprintf('Norm of ending gradient: %8.4g\n', norm(xnew.g));
fprintf('No. Hessian evaluations %d\n',numH);
fprintf('No. Factorizations %d\n\n',numFact);

