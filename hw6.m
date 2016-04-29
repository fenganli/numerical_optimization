global chi
%chi = rand(100, 1)*2-1;
chi = ones(100, 1);
%x=rand(100, 1);
x = ones(100, 1);
%y = rand(100, 1);
y = ones(100, 1);
rho = 10;
z = 1;
iters = 1;
while iters
    iters = iters + 1;
    % The function has the close form, thus we solve them directly
    x_new =zeros(100, 1);
    for i = 1:100
        x_new(i) = (chi(i)-y(i)+rho*z) / (1+rho);
    end
    z_new = 0;
    for i = 1:100
        z_new = z_new+(x_new(i)+1/rho*y(i));
    end
    z_new= z_new/100;
    y_new = zeros(100, 1);
    for i = 1:100
        y_new(i) = y(i) + rho*(x_new(i)-z_new);
    end
    x = x_new
    y = y_new
    z = z_new
    kkt_norm = 0;
    kkt_norm = norm(x-chi+y) + norm(sum(y)) + norm(x-z);
    if (kkt_norm) < 1e-8
        break;
    end
end
iters
x
z
mean(chi)
