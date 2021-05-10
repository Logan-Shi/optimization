function alpha = findAlphaWP(f,g,x,d,alp0)
    a = 0;
    b = inf;
    alpha = alp0;
    iter = 100;
    while iter
        lhs = f(x)+2/3*alpha*transpose(g(x))*d;
        exp = f(x+alpha*d);
        rhs = f(x)+1/4*alpha*transpose(g(x))*d;
        rhs = g(x+alpha*d)-2/3*g(x);
        if(rhs<=0)
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