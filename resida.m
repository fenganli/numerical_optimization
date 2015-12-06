function varargout = resida(x,mode)

argout = 0;
y = [0.14, 0.18, 0.22, 0.25, 0.29, 0.32, 0.35, 0.39, 0.37, ...
     0.58, 0.73, 0.96, 1.34, 2.10, 4.39]';
i = [1:15]';
vw = (16-i)*x(2) + min(i,16-i)*x(3);
r = x(1)*ones(15,1) + i./vw - y;
if bitand(mode,1) 
  argout = argout + 1;
  varargout(argout) = {r};
end
if bitand(mode,2) 
  argout = argout + 1;
  J = [ones(15,1) -[i.*(16-i)./vw.^2] -[i.*min(i,16-i)./vw.^2]];
  varargout(argout) = {J};
end
return;
