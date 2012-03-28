function [ output_args ] = plot_vector( vectors, points, colour )
%PLOT_VECTOR Plot vector lines using direction vectors and points 
%Line = point + g(direction vector)
%   vectors =  is a matrix of 3d direction vector values, 3xm where m is the number of
%   vectors given
%   points = points of the direction vectors given to create the lines

if ~exist('colour', 'var')
    colour = 'r';
end

colour2='c';

for f=1:size(vectors,2);
    g= -100:100:100;
    i = points(1,f) + g*(vectors(1,f)); 
    j = points(2,f) + g*(vectors(2,f));
    k = points(3,f) + g*(vectors(3,f));
    plot3(i,j,k,colour);
    hold on
    plot3(points(1,f),points(2,f),points(3,f),colour2);
    hold on
end
end

