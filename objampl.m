function varargout = objampl(x,mode)
% This uses the AMPL problem that has been initialised
% via a call: [x,bl,bu,v,cl,cu] = spamfunc('stub');

% MCF note: can just replace spamfunc with amplfunc everywhere
% to get dense matrix version of this

global numf numg numH
argout = 0;

%if bitand(mode,1) 
%  numf = numf + 1;
  argout = argout + 1;
  [f,c] = spamfunc(x,0);
  varargout = {f};
%end
%{
if bitand(mode,2) 
  [g,Jac] = spamfunc(x,1);
  numg = numg + 1;
  argout = argout + 1;
  varargout(argout) = {g};
end
if bitand(mode,4) 
  if ~bitand(mode,2)
    [g,Jac] = spamfunc(x,1);
  end
  H = spamfunc(zeros(size(Jac,1),1));
  numH = numH + 1;
  argout = argout + 1;
  varargout(argout) = {H};
end
%}
return;
