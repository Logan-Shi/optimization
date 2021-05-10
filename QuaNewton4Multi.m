function [fmin,xmin,x] = QuaNewton4Multi(f,x0)
x = x0;
H = eye(2);
while norm(g(x(:,end)))>1e-4
    d = -H*g(x(:,end));
    alpha = findAlpha(f,@g,x(:,end),d,1);
    s = alpha*d;
    x_new = x(:,end) + s;
    x = [x,x_new];
    yk = g(x(:,end))-g(x(:,end-1));
    H = H+s*s'/(s'*yk)-H*(yk*yk')*H/(yk'*H*yk);
end
xmin = x_new;
fmin  = f(x_new);
end

function m = g(p)
    x = p(1);
    y = p(2);
    m(1,1) = -400*(x*y - x^3) + 2*(x-1);
    m(2,1) = 200*(y - x^2);
end