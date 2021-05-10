function [x,fval] = SimplexE(f,A,b,Aeq,beq)
    ne = length(beq);
    ni = length(b);
    nt = length(f);
    nv = size(A,2);
    
    tab = [f,zeros(1,ni+nv-nt+1);
           Aeq,zeros(ne,ni),beq;
           A,eye(ni),b];
% 小于零的变量转换       
    for i = 1:ni
        if(b(i)<0)
            tab(1+ne+i,:) = -tab(1+ne+i,:);
        end
    end   
    
    A_n = [tab(2:end,1:nv+ni)];
    b_n = tab(2:end,end);
    f_n = tab(1,1:nv+ni);
    
    [x,fval] = Simplex(f_n,A_n,b_n);
    x = x(1:nv);
end

