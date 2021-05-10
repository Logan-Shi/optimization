function [fmin,xmin,iteration] = QuasiNewton(f,x0,dx,TOL)
x(1) = x0;
while(abs(df(f,x(end),dx))>TOL)
    x_new = x(end) - df(f,x(end),dx)/ddf(f,x(end),dx);
    x = [x,x_new];
end
xmin = x(end);
fmin = f(xmin);
iteration = length(x);
end

function output = df(f,x,dx)
    output = (f(x+dx) - f(x-dx))/2/dx;
end

function output = ddf(f,x,dx)
    output = (f(x+dx) + f(x-dx) - 2*f(x))/dx/dx;
end