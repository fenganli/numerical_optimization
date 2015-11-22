param N := 100;
param a := -1;
param b := -1;
param c := 1;
param d := 1;
param alpha := 1;
param beta := 100;

option randseed 1;

# need to order so banded structure in Hessian
# z = (x1,y1,x2,y2,....,xn,yn)
var z{1..2*N} := Uniform(-1,1);

minimize obj: 
  ((1+alpha*exp(-beta*(a^2+b^2)))*((z[1]-a)^2 + (z[2]-b)^2)
  + sum {i in 1..N-1} (1+alpha*exp(-beta*(z[2*i-1]^2+z[2*i]^2)))*((z[2*(i+1)-1]-z[2*i-1])^2 + (z[2*(i+1)]-z[2*i])^2)
  + (1+alpha*exp(-beta*(z[2*N-1]^2+z[2*N]^2)))*((c-z[2*N-1])^2 + (d-z[2*N])^2))
  *(N+1)
  ;

write ggeosmall;

solve;

display obj;
# display x;
# display y;

