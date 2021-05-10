f = @(x) 2*x(1)^2 - 4*x(1)*x(2)+4*x(2)^6-6*x(1)-3*x(2);
A = [1,1;
    4,1];
b = [3;9];
lb = [0;0];
x0 = [1,1;
    2,2;
    -1,-1;
    10,-10];
for i = 1:size(x0,1)
    tic,
    [x(i,:),fval(i)] = fmincon(f,x0(i,:),A,b,[],[],lb);
    tf(i) = toc;

    tic,
    [xa(i,:),fvala(i)] = ga(f,2,A,b,[],[],lb);
    tg(i) = toc;

end

for i = 1:size(x0,1)
    disp(['fmincon find minimum ' num2str(fval(i)) ' at ' mat2str(x(i,:)) ' with x0: ' mat2str(x0(i,:))])
    disp(['used ' num2str(tf(i)) 's'])
    disp(['ga find minimum ' num2str(fvala(i)) ' at ' mat2str(xa(i,:))])
    disp(['used ' num2str(tg(i)) 's'])
end