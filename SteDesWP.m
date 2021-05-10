function [fmin,xmin,x] = SteDesWP(f,g,x0)
x = x0;
iter = 0;
while iter<3
    iter = iter + 1;
    d = -g(x(:,end));
    alpha = findAlphaWP(f,g,x(:,end),d,1.2);
    x_new = x(:,end) + alpha*d;
    x = [x,x_new];
end
xmin = x_new;
fmin  = f(x_new);
end