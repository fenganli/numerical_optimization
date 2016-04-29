function varargout = qf(x,mode)

global numf numg numH
global x_c
global A

argout = 0;
if bitand(mode,1) 
  numf = numf + 1;
  argout = argout + 1;
  varargout(argout) = {0.5*(x-x_c)'*A*(x-x_c)};
end

if bitand(mode,2) 
  numg = numg + 1;
  argout = argout + 1;
  varargout(argout) = {A*(x-x_c)};
end

if bitand(mode,4) 
  numH = numH + 1;
  argout = argout + 1;
  varargout(argout) = {A};
end

return;
