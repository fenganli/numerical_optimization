probname = 'hs100pen';
[x, bl, bu, v, cl, cu] = spamfunc(probname);
fprintf('Problem: %s, size (%d)\n',probname,length(x));
tic, result = fminsearch(@objampl, x); toc,
result