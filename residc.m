function varargout = residc(x,mode)

argout = 0;
a = 1e-5;
if bitand(mode,1) 
  argout = argout + 1;
  r = [sqrt(a)*(x-ones(size(x))); x'*x - 0.25]; 
  varargout(argout) = {r};
end
if bitand(mode,2) 
  argout = argout + 1;
  J = [sqrt(a)*speye(length(x)); 2*x'];
  varargout(argout) = {J};
end
return;

var x{i in 1..N} := i;
