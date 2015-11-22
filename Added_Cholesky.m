function [R, tao] = Added_Cholesky(H)
%Added_Cholesky algorithm
% try to chol first
[R, fail] = chol(H);
if fail == 0
    tao = 0;
    return;
end
% Now add the multiple of identities into the heissian
beta = 0.001;
min_a_ii =min(diag(H));
if min_a_ii > 0
    tao = 0;
else
    tao = -min_a_ii+beta;
end
while 1
    [R, fail] = chol(H+tao*eye(size(H,1)));
    if fail == 0
        return;
    else
        tao = max(2*tao, beta);
    end
end
        