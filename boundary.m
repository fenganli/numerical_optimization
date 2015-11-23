function p = boundary(p1, p2, delta)
% Find boundary point.
a = norm(p2)^2;
b = 2*p1'*p2;
c = norm(p1)^2-delta^2;
alpha = (-b+sqrt(b^2-4*a*c)) / (2*a);
p = p1+alpha * p2;
return;