f = @(x) 3*x.^4 - 4*x.^3 - 12*x.^2;
x0 = [-1.2];
[~,~,xS] = SteDes(f,@g,x0);
xS(end)
f(xS(end))

[~,~,xS] = SteDesWP(f,@g,x0);
xS(end)
f(xS(end))

function m = g(x)
    m(1,1) = 12*x.^3 - 12*x.^2 - 24*x;
end
