function [fmin,xmin,x] = Newton4Multi(f,g,F,x0)
x = x0;
iter = 0;
while iter<3
    iter = iter+1;
    d = -F(x(:,end))\g(x(:,end));
    alpha = findAlpha(f,g,x(:,end),d,1);
    x_new = x(:,end) + alpha*d;
    x = [x,x_new];
end
xmin = x_new;
fmin  = f(x_new);
end