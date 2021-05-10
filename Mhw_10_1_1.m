f = @(x) 3*x.^4+4*x.^3-12*x.^2+5;
% x = linspace(-3,2,100);
% plot(x,f(x))
a = -2.5;
b = -1.5;
TOL = 1e-4;
[fmin,xmin] = GoldSec(f,a,b,TOL);
disp(['minimum is ' num2str(fmin) ' at' num2str(xmin)])