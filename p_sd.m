function [inform, x] = p_sd(func, x, sdparams)
%Projection SteepDescent function
%   This is  the projection steepdescent function
global numf numg numH x_c A
max_iter = sdparams.maxit;
toler = sdparams.toler;
point.p = x.p;
step_old = 1;
active_old=zeros(100, 1);
for i = 1:max_iter
	if i >= 2
		f_old=point.f;
		point.f=feval(func, point.p, 1);
		if abs(point.f-f_old) < toler
			inform.status=1;
			inform.iter = i;
			x.p=point.p;
			x.f=point.f;
			return;
		end
	else
		point.f=feval(func, point.p, 1);
	end
	point.g = feval(func, point.p, 2);
    
    if strcmp(sdparams.initstep, 'adaptive')
        step = step_size(func, point, point.g, step_old*1/0.9, 0.9, 0.1);
        step_old=step;
    else
        step = step_size(func, point, point.g, 1, 0.9, 0.1);
    end
    point.p = point.p-step*point.g;
	point.p(point.p<0)=0;
    
    if strcmp(sdparams.newton, 'yes')
        
        
        active_now=point.p<=0;
        A_x_dummy=eye(100);
        A_x=[];
        for j=1:100
            if active_now(j) > 0 % active constraint
                A_x=[A_x;A_x_dummy(j, :)];
            end
        end
        active_num=sum(active_now);
        M=[A,-A_x'];
        M=[M;A_x zeros(sum(active_now))];
        V=zeros(100, 1);
        for j=1:100
            if active_now(j) > 0
                V=[V;-x_c(j)];
            end
        end
        %A_x,zeros(100-sum(active_now),100-sum(active_now))];
        %size(M)
        delta = M\V;
        test_p=point.p;
        right=1;
        %delta
        for j=100
            test_p(j)=test_p(j)+0.01*delta(j);
            if test_p(j) < 0
                right=0;
            end
        end
        if i > 1000
            test_p
        end
        if right > 0
            fprintf('it happens\n')
            point.p = test_p;
        end
        
        %right=1;
        %for j=1:size(point.p, 1)
        %    if point.p(j, 1) == 0
        %        test_p(j, 1) = 0;
        %    elseif point.p(j, 1) > 0 && x_c(j, 1) > 0
        %        test_p(j, 1) = x_c(j, 1);
        %    else
        %        right=0;
        %    end
        %end
        % right
        %if right==1
        %    point.p=p;
        %end
        
    end
    
    active_now=point.p<=0;
    if sum(active_now-active_old) > 0
        fprintf('Last Iteration with constraints change: %d, number of different active constrainsts %d.\n', i, sum(active_now-active_old));
    end
    active_old=active_now;
end
inform.status = 0;
inform.iter = max_iter;
x.p = point.p;
x.f= point.f;
return;
end

function step=step_size(func, point, g, alpha, beta, c1)
	x_p = point.p-alpha*g;
	x_p(x_p<0)=0;
	while feval(func, x_p, 1)>feval(func,point.p,1)+c1*g'*(x_p-point.p)
		alpha=alpha*beta;
		x_p=point.p-alpha*g;
		x_p(x_p<0)=0;
	end
	step=alpha;
end

