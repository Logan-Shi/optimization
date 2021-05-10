A = [2,1,-1;
    -4,-3,-1];
b = [5;-3];
Aeq = [-1,1,1];
beq = 2;
lb = [0,0,0];
f = [3,-2,1];
[x,fval] = linprog(f,A,b,Aeq,beq,lb);
disp(['max is ' num2str(-fval) ' at ' mat2str(x)])