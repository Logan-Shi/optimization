function [fmin,xmin,iteration] = InaLine(f,df,x0,alp0,epsi,TOL)
alpha = alp0;
x(1) = x0;
while(abs(df(x(end)))>TOL)
    g = df(x(end));
    d = -g/norm(g);
    while f(x(end)+alpha*d)>(f(x(end))+epsi*alpha*g*d)
        alpha = 0.5*alpha;
    end
    x_new = x(end) + alpha(end)*d;
    x = [x,x_new];
end
xmin = x(end);
fmin = f(xmin);
iteration = length(x);
end