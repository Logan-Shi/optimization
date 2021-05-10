f = @(x) 100*(x(2)-x(1).^2).^2 + (x(1)-1).^2;
x0 = [2;2];
[fmin,xmin,xQ] = QuaNewton4Multi(f,x0);
disp(['Quasi-Newton minimum is ' mat2str(fmin) ' at ' mat2str(xmin)])
[xmin,fmin] = fminsearch(f,x0);
disp(['fminsearch minimum is ' mat2str(fmin) ' at ' mat2str(xmin)])