function [x,fval] = Simplex(f,A,b)
    na = length(b);
    nv = size(A,2);

    z = 0;
    tab = [A,eye(na),b;
           f,zeros(1,na),z];

    basI = nv:nv+na;
    [cs,I] = min(tab(na+1,1:na+nv));
    while(cs<0)
        for i = 1:na
            if tab(i,I)<0
                k(i) = inf;
            else
                k(i) = tab(i,end)/tab(i,I);
            end
        end
        
        [flag,tabI] = min(k);
        if flag == inf
            disp('unbounded')
            x = NaN;
            fval = NaN;
            return
        end
        basI(tabI) = I;
        
        tab(tabI,:) = tab(tabI,:)/tab(tabI,I);
        for i = 1:na+1
            if i == tabI
                continue
            else
                tab(i,:) = tab(i,:) - tab(i,I)/tab(tabI,I)*tab(tabI,:);
            end
        end
        [cs,I] = min(tab(na+1,1:na+nv));
    end
    
    x = zeros(1,na+nv);
    for i = 1:na
        x(basI(i)) = tab(i,end);
    end
    x = x(1:nv);
    fval = tab(end,end);
end