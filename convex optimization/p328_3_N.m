f = @(x) x(1).^2 - 2*x(1)*x(2) + 4*x(2).^2 + x(1) - 3*x(2);
x0 = [1;1];
[~,~,xS] = Newton4Multi(f,@g,@F,x0);
xS(:,end)
f(xS(:,end))

function m = g(x)
    m = zeros(2,1);
    m(1,1) = 2*x(1) - x(2) + 1;
    m(2,1) = -2*x(1) + 8*x(2) - 3;
end

function m = F(x)
    m = zeros(2);
    m(1,1) = 2;
    m(1,2) = -1;
    m(2,1) = -1;
    m(2,2) = 8;
end