f = @(x) 3*x.^4+4*x.^3-12*x.^2+5;
df = @(x) 12*x.^3 + 12*x.^2 - 24*x;
TOL = 1e-4;
[fmin,xmin] = InaLine(f,df,-3,0.5,0.2,TOL);
disp(['minimum is ' num2str(fmin) ' at' num2str(xmin)])