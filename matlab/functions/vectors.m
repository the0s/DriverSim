function [dir_vect, pos] = vectors(position3d, merge_no, plotting)
%VECTORS create vectors on 3d consequtive points inserted
%   position3d -> 3xm  matrix where m is the number of points
%   merge_no -> number of points to merge (EVEN)

if ~exist('plotting', 'var')
    plotting = 'y';
end

n=length(position3d);
x= position3d(1,:);
y= position3d(2,:);
z= position3d(3,:);
dir_vect=[];
if plotting=='y'
    figure
end

for f=1:n-1;
    g= -200:100:200;
    i = x(f) + g*(x(f+1)-x(f)); 
    j = y(f) + g*(y(f+1)-y(f));
    k = z(f) + g*(z(f+1)-z(f));
    %plot3(i,j,k,'y');
    dir_vect(:,f) = position3d(:,f+1)-position3d(:,f);
    %vect =  position3d(:,f) + (position3d(:,f+1)-position3d(:,f))*g;
    %plot3(vect(1,:),vect(2,:),vect(3,:),'y');
    hold on
end

if plotting=='y'
    plot3(x,y,z,'r');
    hold on
end

[s,v1]=overlap_average(dir_vect,merge_no,floor(merge_no/2));
[pos,p_var]=overlap_average(position3d,merge_no,floor(merge_no/2));

if plotting=='y'
    a=0;
    for f=1:length(s);
        if a<=12
            plot_vector(s(:,f),pos(:,f),'g');
            a=a+1;
        else
           plot_vector(s(:,f),pos(:,f),'b');
           a=a+1;
        end
        hold on

        if a==24
            a=0;
        end

    end
end
dir_vect=s;

end

