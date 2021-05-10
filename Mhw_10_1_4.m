f = @(x) 3*x.^4+4*x.^3-12*x.^2+5;
df = @(x) 12*x.^3 + 12*x.^2 - 24*x;
ddf = @(x) 36*x.^2 + 24*x - 24;
TOL = 1e-4;
tic
[~,~,itG] = GoldSec(f,-2.5,-1.5,TOL);
tG = toc;
disp(['Golden Section Method used: ' num2str(tG)])
tic
[~,~,itN] = Newton(f,df,ddf,-1.5,TOL);
tN = toc;
disp(['Newton Method used: ' num2str(tN)])
tic
[~,~,itI] = InaLine(f,df,-3,0.5,0.2,TOL);
tI = toc;
disp(['Inaccurate Line search used: ' num2str(tI)])
tic,
[x,fval] = fminbnd(f,-3,2);
tF = toc;
disp(['fminbnd used: ' num2str(tF)])
disp(['Gold Section Method Iterated: ' num2str(itG)])
disp(['Newton Method Iterated: ' num2str(itN)])
disp(['Inaccurate Line Search Iterated: ' num2str(itI)])