function varargout = obj183(x, mode)


syms x1 x2 x3 x4 x5
input = [x1; x2; x3; x4; x5];
f = exp(x1*x2*x3*x4*x5) - 0.5*(x1^3+x2^3+1)^2;
gradient_f = gradient(f);
hessian_f = hessian(f);

argout = 0;
if bitand(mode,1) 
  argout = argout + 1;
  % varargout(argout) = {x(1) + x(2)};
  varargout(argout) = {double(subs(f, input, x))};
end
if bitand(mode,2) 
  argout = argout + 1;
  % varargout(argout) = {[1; 1]};
  varargout(argout) = {double(subs(gradient_f, input, x))};
end
if bitand(mode,4) 
  argout = argout + 1;
  % varargout(argout) = {[0 0; 0 0]};
  varargout(argout) = {double(subs(hessian_f, input, x))};
end
return;