sdparams = struct('maxit', 1000, 'toler', 1.0e-4);
test_num = 1000;
range = 100;
min_num = 1000;
min_x=0;
for i = 1:test_num
    x=range*rand(2,1);
    x=struct('p',x);
    [inform, x] = SteepDescent(@ann, x, sdparams);
    if inform.status == 0
        'no convergence'
    else
        if x.f < min_num
            min_num = x.f;
            min_x = x.p;
        end
    end
end
min_x
min_num