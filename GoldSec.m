function [fmin,xmin,iteration] = GoldSec(f,g,a,b,TOL)
x1 = a + (1-g)*(b-a);
f1 = f(x1);
x2 = a + g*(b-a);
f2 = f(x2);
iteration = 0;
while(b-a)>TOL
    iteration = iteration + 1;
    if (f1>f2)
        a = x1;
        x1 = x2;
        f1 = f2;
        x2 = a + g*(b-a);
        f2 = f(x2);
    else
        b = x2;
        x2 = x1;
        f2 = f1;
        x1 = a + (1-g)*(b-a);
        f1 = f(x1);
    end
end
fmin = f(x1);
xmin = x1;
end

