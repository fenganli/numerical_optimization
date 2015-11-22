[x,l,u,v,cl,cu]=spamfunc('geodesic');
xstart=struct('p', x);
nparams=struct('maxit',1000,'toler',1e-4,'method','chol');
tic, [inform, xsol]=Newton(@objampl, xstart, nparams); toc,
xsol