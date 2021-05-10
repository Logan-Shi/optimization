f = @(x) 3*x.^4 - 4*x.^3 - 12*x.^2;
df = @(x) 12*x.^3 - 12*x.^2 - 24*x;
ddf = @(x) 36*x.^2 - 24*x - 24;
TOL = 1e-1;
[fmin,xmin,iter] = Newton(f,df,ddf,-1.2,TOL,2);
disp(['Newton Method: minimum is ' num2str(fmin) ' at ' num2str(xmin)])
disp(iter)
% [fmin,xmin] = QuasiNewton(f,-1.5,1e-3,TOL);
% disp(['Quasi-Newton Method: minimum is ' num2str(fmin) ' at' num2str(xmin)])