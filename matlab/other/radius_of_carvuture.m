function [ curv ] = radius_of_carvuture( x,y )
%RADIUS_OF_CARVUTURE Summary of this function goes here
%   Detailed explanation goes here
 figure
 plot(x,y,'g');
 hold on
 f = 100:200;
 x=x(1,f);
 y=y(1,f);
 mx = mean(x); 
 my = mean(y);
 
 %% Get differences from means
 X = x - mx; 
 Y = y - my; 
 
 %% Get variances
 dx2 = mean(X.^2); 
 dy2 = mean(Y.^2); 
 
 %% Solve least mean squares problem
 t = [X,Y]\(X.^2-dx2+Y.^2-dy2)/2;
 
 %% t is the 2 x 1 solution array [a0;b0]
 a0 = t(1);
 b0 = t(2); 
 
 %% Calculate the radius
 r = sqrt(dx2+dy2+a0^2+b0^2);
 
 %% Locate the circle's center
 a = a0 + mx;
 b = b0 + my;
 
 curv = 1/r; % Get the curvature

 
%figure
plot(x,y);
hold on
z = linspace(r+a,-r+a);
t= sqrt( (r^2) - ((z-a).^2) ) + b;
%t= sqrt(25-(z.^2));
plot(z,t,'r',z,-t,'r');
end


