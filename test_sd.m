[x,l,u,v,cl,cu]=spamfunc('geodesic');
xstart=struct('p', x);
nparams=struct('maxit',100000,'toler',1e-4,'method','chol');
[inform, xsol]=SteepDescent(@objampl, xstart, nparams);
xsol