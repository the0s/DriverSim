function [ m ] = tangents( x , y)
%TANGENTS Summary of this function goes here
%   Detailed explanation goes here


n=length(x);
m=[];
figure
for f=1:n-1;
    i= x(f)-1:0.001:x(f+1)+1;
    m(f) = ( (y(f+1)-y(f))/(x(f+1)-x(f)) );
    j=m(f)*(i-x(f)) + y(f);
    plot(i,j);
    hold on
end
plot(x,y,'r');


end
