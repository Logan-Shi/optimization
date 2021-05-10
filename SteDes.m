function [fmin,xmin,x] = SteDes(f,g,x0)
x = x0;
iter = 0;
while iter<20
    d = -g(x(:,end));
    alpha = findAlpha(f,g,x(:,end),d,1.2);
    x_new = x(:,end) + alpha*d;
    x = [x,x_new];
    iter = iter + 1;
end
xmin = x_new;
fmin  = f(x_new);
end