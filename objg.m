function varargout = objg(x,mode)

global numf numg numH

gamma = 100.0;
m = length(x); 
if rem(m,2) == 1
  error('n must be multiple of 2');
else
  n = m/2;
end
scale = 10;
argout = 0;
f = 0; g = zeros(m,1); H = zeros(m,m);
for i=1:n
  j = 2*i; k = 2*i-1;
  z= x(j) - x(k)^2;
  f = f + scale*z^2 + (1-x(k))^2;
  g(k:j) = [-4*scale*x(k)*z + 2*x(k) - 2; 2*scale*z];
  H(k:j,k:j) = [12*scale*x(k)^2-4*scale*x(j)+2 -4*scale*x(k); -4*scale*x(k) 2*scale];
end
if bitand(mode,1) 
  f = f + gamma*(sum(x)-1)^2/2;
  numf = numf + 1;
  argout = argout + 1;
  varargout(argout) = {f};
end
if bitand(mode,2) 
  g = g + gamma*(sum(x)-1)*ones(m,1);
  numg = numg + 1;
  argout = argout + 1;
  varargout(argout) = {g};
end
if bitand(mode,4) 
  H = H + gamma*ones(m,m);
  numH = numH + 1;
  argout = argout + 1;
  varargout(argout) = {sparse(H)};
end
return;
