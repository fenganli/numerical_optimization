global numf numg numH
global resid

resid = 'resida';
x = struct('p',ones(3,1));

nparams = struct('maxit',1000,'toler',1.0e-4,'lsmethod','chol');
[inform,xnew] = GaussN(@objnls,x,nparams);
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n', nparams.toler);
else
  fprintf('(chol) Success: %d steps taken\n', inform.iter);
end
fprintf('  Ending point: '); fprintf('%8.4g ',xnew.p);
fprintf('\n  Ending value: '); fprintf('%8.4g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('\n  Ending gradient: '); fprintf('%8.4g ',xnew.g);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %8.4g\n\n\n', norm(xnew.g));

nparams.lsmethod = 'qr';
[inform,xnew] = GaussN(@objnls,x,nparams);
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n', nparams.toler);
else
  fprintf('(qr) Success: %d steps taken\n', inform.iter);
end
fprintf('  Ending point: '); fprintf('%8.4g ',xnew.p);
fprintf('\n  Ending value: '); fprintf('%8.4g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('\n  Ending gradient: '); fprintf('%8.4g ',xnew.g);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %8.4g\n\n\n', norm(xnew.g));

nparams.lsmethod = 'svd';
[inform,xnew] = GaussN(@objnls,x,nparams);
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n', nparams.toler);
else
  fprintf('(svd) Success: %d steps taken\n', inform.iter);
end
fprintf('  Ending point: '); fprintf('%8.4g ',xnew.p);
fprintf('\n  Ending value: '); fprintf('%8.4g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('\n  Ending gradient: '); fprintf('%8.4g ',xnew.g);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %8.4g\n\n\n', norm(xnew.g));

resid = 'residb';
x = struct('p',0.1*ones(2,1));

nparams = struct('maxit',1000,'toler',1.0e-4,'lsmethod','chol');
[inform,xnew] = GaussN(@objnls,x,nparams);
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n', nparams.toler);
else
  fprintf('(chol) Success: %d steps taken\n', inform.iter);
end
fprintf('  Ending point: '); fprintf('%12.8g ',xnew.p);
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('\n  Ending gradient: '); fprintf('%12.8g ',xnew.g);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

nparams.lsmethod = 'qr';
[inform,xnew] = GaussN(@objnls,x,nparams);
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %12.8g.\n', nparams.toler);
else
  fprintf('(qr) Success: %d steps taken\n', inform.iter);
end
fprintf('  Ending point: '); fprintf('%12.8g ',xnew.p);
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('\n  Ending gradient: '); fprintf('%12.8g ',xnew.g);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

nparams.lsmethod = 'svd';
[inform,xnew] = GaussN(@objnls,x,nparams);
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %12.8g.\n', nparams.toler);
else
  fprintf('(svd) Success: %d steps taken\n', inform.iter);
end
fprintf('  Ending point: '); fprintf('%12.8g ',xnew.p);
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('\n  Ending gradient: '); fprintf('%12.8g ',xnew.g);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

resid = 'residc';
x = struct('p',[1:1000]');

nparams = struct('maxit',1000,'toler',1.0e-4,'lsmethod','chol');
fprintf('Problem: %s, size (%d), GN:chol\n',resid,length(x.p));
tic, [inform,xnew] = GaussN(@objnls,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n', inform.iter);
end
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

nparams.lsmethod = 'qr';
fprintf('Problem: %s, size (%d), GN:qr\n',resid,length(x.p));
tic, [inform,xnew] = GaussN(@objnls,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %12.8g.\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n', inform.iter);
end
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

nparams.lsmethod = 'svd';
fprintf('Problem: %s, size (%d), GN:svd\n',resid,length(x.p));
tic, [inform,xnew] = GaussN(@objnls,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %12.8g.\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n', inform.iter);
end
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

resid = 'residd';
x = struct('p',0.5*ones(10,1));

nparams = struct('maxit',3000,'toler',1.0e-4,'lsmethod','chol');
fprintf('Problem: %s, size (%d), GN:chol\n',resid,length(x.p));
tic, [inform,xnew] = GaussN(@objnls,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %8.4g.\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n', inform.iter);
end
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

nparams.lsmethod = 'qr';
fprintf('Problem: %s, size (%d), GN:qr\n',resid,length(x.p));
tic, [inform,xnew] = GaussN(@objnls,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %12.8g.\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n', inform.iter);
end
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

nparams.lsmethod = 'svd';
fprintf('Problem: %s, size (%d), GN:svd\n',resid,length(x.p));
tic, [inform,xnew] = GaussN(@objnls,x,nparams); toc,
if inform.status == 0
  fprintf('CONVERGENCE FAILURE: %d steps were taken without\n', inform.iter);
  fprintf('gradient size decreasing below %12.8g.\n', nparams.toler);
else
  fprintf('Success: %d steps taken\n', inform.iter);
end
fprintf('\n  Ending value: '); fprintf('%12.8g ',xnew.f);
fprintf('; No. function evaluations: %d',numf);
fprintf('; No. gradient evaluations %d',numg);
fprintf('\n  Norm of ending gradient: %12.8g\n\n\n', norm(xnew.g));

nparams = struct('maxit',2000,'toler',1.0e-4,'delbar',100,'eta',0.1,'initdel',1,'method','chol','hessian','exact','m',29);

