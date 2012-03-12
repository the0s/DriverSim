function [ dir_vect ] = vectors( position3d)
%VECTORS Summary of this function goes here
%   Detailed explanation goes here

n=length(position3d);
x= position3d(1,:);
y= position3d(2,:);
z= position3d(3,:);
dir_vect=[];
figure

for f=1:n-1;
    g= -5:0.01:5;
    
    i = x(f) + g*(x(f+1)-x(f)); 
    j = y(f) + g*(y(f+1)-y(f));
    k = z(f) + g*(z(f+1)-z(f));
    plot3(i,j,k);
    dir_vect(:,f) = position3d(:,f+1)-position3d(:,f);
    %vect =  position3d(:,f) + (position3d(:,f+1)-position3d(:,f))*g;
    %plot3(vect(1,:),vect(2,:),vect(3,:));
    hold on
end
plot3(x,y,z,'r');




end

