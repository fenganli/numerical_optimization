function varargout = c173(x, mode)


syms x1 x2
input = [x1; x2];
f = x1^2 + x2^2-2;
gradient_f = gradient(f);
hessian_f = hessian(f);

argout = 0;
if bitand(mode,1) 
  argout = argout + 1;
  varargout(argout) = {double(subs(f, input, x))};
end
if bitand(mode,2) 
  argout = argout + 1;
  varargout(argout) = {double(subs(gradient_f, input, x))'};
end
if bitand(mode,4) 
  argout = argout + 1;
  varargout(argout) = {double(subs(hessian_f, input, x))};
end
return;