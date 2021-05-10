f = @(x) exp(-x(1)^2*x(2)^2)+(x(1)-1)^2+(x(2)-1)^2;
x0 = [2,3,4;
      2,3,4];
for i = 1:size(x0,2)
    [fmin,xmin,xN] = Newton4Multi(f,@g,@F,x0(:,i));
    disp(['Newton Method minimum is ' mat2str(fmin) ' at ' mat2str(xmin)])
    [xmin,fmin] = fminsearch(f,x0(:,i));
    disp(['fminsearch minimum is ' mat2str(fmin) ' at ' mat2str(xmin)])
end


function m = g(p)
    x = p(1);
    y = p(2);
    m(1,1) = -2*x*y^2*exp(-x^2*y^2) + 2*(x-1);
    m(2,1) = -2*x^2*y*exp(-x^2*y^2) + 2*(y-1);
end

function m = F(p)
    x = p(1);
    y = p(2);
    m(1,1) = (4*x^2*y^4-2*y^2)*exp(-x^2*y^2) + 2;
    m(1,2) = (4*x^3*y^3-4*x*y)*exp(-x^2*y^2);
    m(2,1) = (4*x^3*y^3-4*x*y)*exp(-x^2*y^2);
    m(2,2) = (4*x^4*y^2-2*x^2)*exp(-x^2*y^2) + 2; 
end

function [fmin,xmin,x] = Newton4Multi(f,g,F,x0)
x = x0;
while norm(g(x(:,end)))>1e-4
    d = -F(x(:,end))\g(x(:,end));
    alpha = findAlpha(f,g,x(:,end),d,1);
    x_new = x(:,end) + alpha*d;
    x = [x,x_new];
end
xmin = x_new;
fmin  = f(x_new);
end

function alpha = findAlpha(f,g,x,d,alp0)
    a = 0;
    b = inf;
    alpha = alp0;
    iter = 100;
    while iter
        lhs = f(x)+0.8*alpha*transpose(g(x))*d;
        exp = f(x+alpha*d);
        rhs = f(x)+0.2*alpha*transpose(g(x))*d;
        if(exp<=rhs)
            if(exp>=lhs)
                break;
            else
                a = alpha;
                if isinf(b)
                    alpha = 2*alpha;
                else
                    alpha = (a+b)/2;
                end
            end
        else
            b = alpha;
            alpha = (a+b)/2;
        end
    iter = iter-1;
    end
end