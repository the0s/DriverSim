function [ Indexa ] = assing_angles( real_structure, users_structure,plotting )
%ASSING_ANGLES Get Real angles and assing them to the user according to the
%coordinates maximum and minimum
%  THIS IS NOT USED SINCE WE CAN HAVE POINTS NOT ASSINGED TO AN ANGLE
%   INPUTS
% real_structure --> structure of the road that has the angles with the coordinates
% users_structure --> structure of the user that the angle are goint to be assigned
%OUTPUT
%structure of user_structure input where the angles assinged added to it
if ~exist('plotting', 'var')
    plotting = 'y' ;
end

angles_real = real_structure.angles;
max_min_real = real_structure.max_min;

max_min_user = users_structure.max_min;

%road_offset=[15.0;0.4;10.0];
%temp=1;
for x=1:size(max_min_user,2)
    %l=0;
    for p=1:1:3 %set the offset for matching (car can go up or down, left or right to a straight road)
        if users_structure.mean_var{1,x}(p,2) < 1
            road_offset(p,1) = 30;
        else
            road_offset(p,1) = 10;
        end
    end
    for y=1:size(max_min_real,2)
       max_user = max_min_user{1,x}(:,2) - road_offset;
       max_real = max_min_real{1,y}(:,2) ;
       
       min_user = max_min_user{1,x}(:,1) + road_offset; 
       min_real= max_min_real{1,y}(:,1) ;
       
       if  and(( max_user <= max_real ),( min_user >= min_real ) )
            users_structure.anglesLap(1,x) = angles_real(1,y);         
            %if (temp == x)
            %    l=l+1;
            %end
            %temp=x;
            %display(x);
            break;
       else
            users_structure.anglesLap(1,x) = -1;
       end
    end
    %display(l);  
end
if plotting=='y'
    subplot(1,2,1)
    plot(users_structure.anglesLap);
    subplot(1,2,2)
    plot(angles_real);
end
Indexa=users_structure;

end

