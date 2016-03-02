function varargout = c183(x, mode)


syms x1 x2 x3 x4 x5
input = [x1; x2; x3; x4; x5];
f1 = x1^2+x2^2+x3^2+x4^2+x5^2-10;
f2 = 0*x1 + x2*x3-5*x4*x5;
f3 = x1^3+x2^3+0*x3+0*x4+0*x5 + 1;
gradient_f1 = gradient(f1);
gradient_f2 = gradient(f2, [x1 x2 x3 x4 x5]);
gradient_f3 = gradient(f3, [x1 x2 x3 x4 x5]);
% hessian_f1 = hessian(f1);
% hessian_f2 = hessian(f2);
% hessian_f3 = hessian(f3);

argout = 0;
if bitand(mode,1) 
  argout = argout + 1;
  % varargout(argout) = {x(1) + x(2)};
  varargout(argout) = {[double(subs(f1, input, x)); double(subs(f2, input, x)); double(subs(f3, input, x))]};
end
if bitand(mode,2) 
  argout = argout + 1;
  % varargout(argout) = {[1; 1]};
  varargout(argout) = {[double(subs(gradient_f1, input, x))'; double(subs(gradient_f2, input, x))'; double(subs(gradient_f3, input, x))']};
end
% no hessian
%if bitand(mode,4) 
%  argout = argout + 1;
  % varargout(argout) = {[0 0; 0 0]};
%  varargout(argout) = {double(subs(hessian_f, input, x))};
%end
return;