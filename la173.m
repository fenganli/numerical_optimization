function varargout = la173(x, mode)

global lambda_k mu_k

syms x1 x2
input = [x1; x2];
f = x1 + x2 - lambda_k * (x1^2+x2^2-2) + mu_k / 2 * (x1^2 + x2^2 -2)^2;
gradient_f = gradient(f);
hessian_f = hessian(f);

argout = 0;
if bitand(mode,1) 
  argout = argout + 1;
  % varargout(argout) = {f(x, mode) - times(lambda_k, c(x, mode)) + 0.5 * times(mu_k, c(x, mode))};
  varargout(argout) = {double(subs(f, input, x))};
end
if bitand(mode,2) 
  argout = argout + 1;
  % output = f(x, mode);
  % c_values = c(x, 1);
  % c_size = size(c_values, 1);
  % c_gradients = c(x, 2);
  % for i = 1:c_size
  %	  output = output + (mu_k(i)*c_values(i)-lambda_k(i))*c_gradients(i, :)';
  % end
  % varargout(argout) = {output}
  varargout(argout) = {double(subs(gradient_f, input, x))};
end
if bitand(mode,4) 
  argout = argout + 1;
  varargout(argout) = {double(subs(hessian_f, input, x))};
end
return;

