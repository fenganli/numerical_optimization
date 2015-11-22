function varargout = objsimp(x,mode)

global numf numg numH

argout = 0;
if bitand(mode,1) 
  numf = numf + 1;
  argout = argout + 1;
  varargout(argout) = {x^2 + exp(x)};
end
if bitand(mode,2) 
  numg = numg + 1;
  argout = argout + 1;
  varargout(argout) = {2*x + exp(x)};
end
if bitand(mode,4) 
  numH = numH + 1;
  argout = argout + 1;
  varargout(argout) = {2 + exp(x)};
end
return;
