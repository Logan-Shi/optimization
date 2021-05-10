f = @(x) exp(-x)+x.^2;
a = 0;
b = 1;
TOL = 1e-4;
g = (sqrt(5)-1)/2;
[fmin,xmin] = GoldSec(f,g,a,b,TOL);
disp(['minimum is ' num2str(fmin) ' at ' num2str(xmin)])