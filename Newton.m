function [fmin,xmin,iteration] = Newton(f,df,ddf,x0,TOL,max_iter)
x(1) = x0;
while(abs(df(x(end)))>TOL || length(x)<=max_iter)
    x_new = x(end) - df(x(end))/ddf(x(end));
    x = [x,x_new];
end
xmin = x(end);
fmin = f(xmin);
iteration = length(x);
end