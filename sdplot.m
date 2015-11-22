x = linspace(-2,2);
y = linspace(-2,2);
[X,Y] = meshgrid(x,y);
size(X)
size(Y)
alpha = 1;
beta = 100;
rho=@(x,y) (1+alpha*exp(-beta*(x.^2+y.^2)));
rho_vals = zeros(size(X, 1), size(X,2));
for i = 1:size(X,1)
    for j = 1:size(X,2)
        % rho_vals(i,j) = rho([X(i,j); Y(i,j)], 1);
        rho_vals(i,j) = 1+alpha*exp(-beta*(X(i,j)^2+Y(i,j)^2));
    end
end
figure('Position',[671 576 560 420]);
contour(X,Y,rho_vals,20);
hold on;
for i = 1:1000
    x_plot(i) = xsol.p(i*2-1);
    y_plot(i) = xsol.p(i*2);
    % x_plot=[-1 -0.4487   0.1076  0.5469  0.7813  0.8974 1];
    % y_plot = [-1 -0.8946 -0.7536 -0.4341 -0.01582  0.4621 1];
end
plot(x_plot, y_plot);