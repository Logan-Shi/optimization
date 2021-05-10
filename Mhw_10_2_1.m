f = @(x) 100*(x(2)-x(1).^2).^2 + (x(1)-1).^2;
x0 = [2;2];
[fmin,xmin,xS] = SteDes(f,@g,x0);
disp(['Steepest Descent minimum is ' mat2str(fmin) ' at ' mat2str(xmin)])
[fmin,xmin,xN] = Newton4Multi(f,@g,@F,x0);
disp(['Newton Method minimum is ' mat2str(fmin) ' at ' mat2str(xmin)])

function m = g(p)
    x = p(1);
    y = p(2);
    m(1,1) = -400*(y*x - x^3) + 2*(x-1);
    m(2,1) = 200*(y - x^2);
end

function m = F(p)
    x = p(1);
    y = p(2);
    m(1,1) = -400*(y-3*x^2)+2;
    m(1,2) = -400*x;
    m(2,1) = -400*x;
    m(2,2) = 200; 
end