function varargout = ann(x,mode)

global numf numg numH

data_y = [1.165 0.626 0.075 0.351 -0.696]';
data_z = [1 -1 -1 1 1]';
data_size = size(data_y, 1);

argout = 0;
if bitand(mode,1) 
  numf = numf + 1;
  argout = argout + 1;
  result = 0;
  for i=1:data_size
      xi = x(1) + x(2)*data_y(i);
      result=result+(data_z(i)-phi(xi))^2/2;
  end
  varargout(argout) = {result};
end
if bitand(mode,2) 
  numg = numg + 1;
  argout = argout + 1;
  gradient=[0;0];
  sum=0;
  for i=1:data_size
     xi = x(1) + x(2)*data_y(i);
     delta = (data_z(i)-phi(xi))*(-1)*(1-phi(xi)^2);
     gradient(1)=gradient(1)+delta;
     gradient(2)=gradient(2)+delta*data_y(i);
  end

  varargout(argout) = {gradient};
end
%{
Doesn't support hessian right now
if bitand(mode,4) 
  numH = numH + 1;
  argout = argout + 1;
  varargout(argout) = {[2 0; 0 10]};
end
%}
return;
