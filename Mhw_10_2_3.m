f = @(x) 100*(x(2)-x(1).^2).^2 + (x(1)-1).^2;
x0 = [2;2];
[~,~,xS] = SteDes(f,@g,x0);
[~,~,xN] = Newton4Multi(f,@g,@F,x0);
[~,~,xQ] = QuaNewton4Multi(f,x0);

xp = linspace(-4,4);
yp = linspace(-4,4);
[X,Y] = meshgrid(xp,yp);
Z = 100*(Y-X.^2).^2 + (X-1).^2;
surf(X,Y,Z)
hold on
for i = 1:size(xS,2)
    xS(3,i) = f(xS(1:2,i));
end
for i = 1:size(xN,2)
    xN(3,i) = f(xN(1:2,i));
end
for i = 1:size(xQ,2)
    xQ(3,i) = f(xQ(1:2,i));
end
plot3(xS(1,:),xS(2,:),xS(3,:),'-o')
plot3(xN(1,:),xN(2,:),xN(3,:),'-o')
plot3(xQ(1,:),xQ(2,:),xQ(3,:),'-o')
legend('objectiv fcn','Steepest Desent','Newton','Quasi-Newton')
xlabel('x');ylabel('y');zlabel('z')
title('Multi-variable optimization')
view(30,80)

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