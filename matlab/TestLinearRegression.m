a=user_inputs('the0-golf1.txt');

x1 = a(1,:)';
x2 = a(2,:)'; % Contains NaN data
x3 = a(3,:)';
x4 = a(3,:)';
y = a(5,:)';

X = [ones(size(x1)) x1 x2 x3 x4 x1.*x2 x1.*x3 x1.*x4 x2.*x3 x2.*x4 x3.*x4 x1.*x2.*x3 x1.*x4.*x3 x2.*x4.*x3 x1.*x2.*x4.*x3 ];
b = regress(y,X) % Removes NaN data


scatter3(x1,x2,y,'filled')
hold on
x1fit = min(x1):0.100:max(x1);
x2fit = min(x2):0.10:max(x2);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('Weight')
ylabel('Horsepower')
zlabel('MPG')
view(50,10)