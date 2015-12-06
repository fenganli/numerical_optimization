function varargout = objnls(x,mode)

global numf numg
global resid

argout = 0;
s = sprintf('[r,J] = %s(x,3);',resid);
eval(s);
if bitand(mode,1) 
  numf = numf + 1;
  argout = argout + 1;
  varargout(argout) = {0.5*r'*r};
end
if bitand(mode,2) 
  numg = numg + 1;
  argout = argout + 1;
  varargout(argout) = {J'*r};
end
if bitand(mode,4) 
  error('Hessian not calculated');
end
return;
