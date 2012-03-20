function [ output_args ] = plot_vector( vectors, points )
%PLOT_VECTOR Summary of this function goes here
%   Detailed explanation goes here
for f=1:length(vectors);
    g= -100:100:100;
    i = points(1,f) + g*(vectors(1,f)); 
    j = points(2,f) + g*(vectors(2,f));
    k = points(3,f) + g*(vectors(3,f));
    plot3(i,j,k,'g');
    hold on
    plot3(points(1,f),points(2,f),points(3,f),'r+');
    hold on
end
end

