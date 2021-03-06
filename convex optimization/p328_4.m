clc;close all;
figure()
x = linspace(-200,200,100);
y = linspace(-200,200,100);
[X,Y] = meshgrid(x,y);
Z = X.^2 + 4*Y.^2 - 4*X - 8*Y;
surf(X,Y,Z);
x0 = [0;0];
f = @(x) x(1).^2 + 4*x(2).^2 - 4*x(1) - 8*x(2);
[~,~,xS] = SteDes(f,@g,x0);
xS(:,end)
f(xS)

function m = g(x)
    m = zeros(2,1);
    m(1,1) = 2*x(1) - 4;
    m(2,1) = 8*x(2) - 8;
end