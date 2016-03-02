function varargout = la183(x, mode)

global lambda_k mu_k

syms x1 x2 x3 x4 x5
input = [x1; x2; x3; x4; x5];
c1 = x1^2+x2^2+x3^2+x4^2+x5^2-10;
c2 = x2*x3-5*x4*x5;
c3 = x1^3+x2^3+1;
f = exp(x1*x2*x3*x4*x5)-0.5*(x1^3+x2^3+1)^2-lambda_k(1)*c1-lambda_k(2)*c2-lambda_k(3)*c3+mu_k/2*(c1^2+c2^2+c3^2);

gradient_f = gradient(f);
hessian_f = hessian(f);

argout = 0;
if bitand(mode,1) 
  argout = argout + 1;
  varargout(argout) = {double(subs(f, input, x))};
end
if bitand(mode,2) 
  argout = argout + 1;
  varargout(argout) = {double(subs(gradient_f, input, x))};
end
if bitand(mode,4) 
  argout = argout + 1;
  varargout(argout) = {double(subs(hessian_f, input, x))};
end
return;