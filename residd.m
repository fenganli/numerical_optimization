function varargout = residd(x,mode)

argout = 0;
a = 1e-5;
n = length(x);
i = [1:n]';
y = exp(i/10) + exp((i-1)/10);
e = exp(x(i)/10);
i = [2:n]';
j = n:-1:1;

if bitand(mode,1) 
  argout = argout + 1;
  r = [x(1)-0.2;  ...
     sqrt(a)*(e(i) + e(i-1) - y(i)); ...
     sqrt(a)*(e(i) - exp(-1/10)*ones(n-1,1)); ...
     sum(j'.*(x.^2))-1];
  varargout(argout) = {r};
end
% keyboard,
if bitand(mode,2) 
  argout = argout + 1;
  J = [1 zeros(1,n-1); ...
     sqrt(a)/10*spdiags([e(i-1) e(i)],0:1,n-1,n); ...
     sqrt(a)/10*spdiags(e(i),1,n-1,n); ...
     2*j.*x' ];
  varargout(argout) = {J};
end
return;



