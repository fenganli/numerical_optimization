global numf numg numH numFact
global resid

x = struct('p',ones(600,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact');


fprintf('objg: Newton, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = Newton(@objg,x,nparams); toc,
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

x = struct('p',ones(1000,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact');

fprintf('objg: Newton, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = Newton(@objg,x,nparams); toc,
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

x = struct('p',ones(2000,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact');

fprintf('objg: Newton, Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = Newton(@objg,x,nparams); toc,
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

%{
probname = 'brownal';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = Newton(@objampl,x,nparams); toc,
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

probname = 'watson';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = Newton(@objampl,x,nparams); toc,
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

probname = 'geodesic';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = Newton(@objampl,x,nparams); toc,
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

probname = 'cragglvy';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = Newton(@objampl,x,nparams); toc,
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

probname = 'woods';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = Newton(@objampl,x,nparams); toc,
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
%}
fprintf('Now using BFGS\n\n');

x = struct('p',ones(2000,1));
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact');

fprintf('objg: Problem size: '); fprintf('%d\n',length(x.p));
tic, [inform,xnew] = BFGS(@objg,x,nparams); toc,
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

probname = 'brownal';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = BFGS(@objampl,x,nparams); toc,
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

probname = 'watson';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = BFGS(@objampl,x,nparams); toc,
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


probname = 'geodesic';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = BFGS(@objampl,x,nparams); toc,
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


probname = 'cragglvy';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = BFGS(@objampl,x,nparams); toc,
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

probname = 'woods';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = BFGS(@objampl,x,nparams); toc,
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

%}
% NOW DO LBFGS STUFF
nparams = struct('maxit',1000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1);
nparams.m = 3;
fprintf('\n\nLBFGS memory parameter = %d\n',nparams.m);

fprintf('Problem a\n');
x = struct('p',[-1.2; 1]);
tic, [inform,xnew] = LBFGS(@obja,x,nparams); toc,
% tic, [inform,xnew] = PR(@obja,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

fprintf('Problem b\n');
x = struct('p',[-1.2; 1]);
tic, [inform,xnew] = LBFGS(@objb,x,nparams); toc,
% tic, [inform,xnew] = PR(@objb,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

fprintf('Problem c\n');
x = struct('p',[-1.2; 1]);
tic, [inform,xnew] = LBFGS(@objc,x,nparams); toc,
% tic, [inform,xnew] = PR(@objc,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

fprintf('Problem d\n');
x = struct('p',[-1.2; 1]);
tic, [inform,xnew] = LBFGS(@objd,x,nparams); toc,
% tic, [inform,xnew] = PR(@objd,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'brownal';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = PR(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'watson';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
% tic, [inform,xnew] = PR(@objampl,x,nparams); toc,
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'geodesic';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
% tic, [inform,xnew] = PR(@objampl,x,nparams); toc,
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'cragglvy';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
% tic, [inform,xnew] = PR(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'woods';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
% tic, [inform,xnew] = PR(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

nparams.m = 5;
fprintf('\n\nLBFGS memory parameter = %d\n',nparams.m);

probname = 'brownal';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'watson';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'geodesic';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'cragglvy';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'woods';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

nparams.m = 17;
fprintf('\n\nLBFGS memory parameter = %d\n',nparams.m);

probname = 'brownal';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'watson';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'geodesic';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'cragglvy';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'woods';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

nparams.m = 29;
fprintf('\n\nLBFGS memory parameter = %d\n',nparams.m);

probname = 'brownal';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'watson';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'geodesic';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'cragglvy';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);

probname = 'woods';
[x,bl,bu,v,cl,cu] = spamfunc(probname);
x = struct('p',x);
fprintf('Problem: %s, size (%d)\n',probname,length(x.p));
tic, [inform,xnew] = LBFGS(@objampl,x,nparams); toc,
% tic, [inform,xnew] = TNewton(@objampl,x,nparams); toc,
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
fprintf('No. Hessian evaluations %d\n\n',numH);
