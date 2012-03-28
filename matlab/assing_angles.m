function [ Indexa ] = assing_angles( real_cell, users_cell )
%ASSING_ANGLES Get Real angles and assing them to the user according to the
%coordinates
%   Detailed explanation goes here

angles_real = real_cell.angles;
max_min_real = real_cell.max_min;

max_min_user = users_cell.max_min;

road_offset=[15.0;0.4;10.0];
%temp=1;
for x=1:size(max_min_user,2)
    %l=0;
    for y=1:size(max_min_real,2)
       max_user = max_min_user{1,x}(:,2);
       max_real = max_min_real{1,y}(:,2) + road_offset;
       
       min_user = max_min_user{1,x}(:,1); 
       min_real= max_min_real{1,y}(:,1) - road_offset;
       
       if  and(( max_user <= max_real ),( min_user >= min_real ) )
            users_cell.anglesLap(1,x) = angles_real(1,y);         
            %if (temp == x)
            %    l=l+1;
            %end
            %temp=x;
            %display(x);
            break;
       else
            users_cell.anglesLap(1,x) = -1;
       end
    end
    %display(l);  
end
subplot(1,2,1)
plot(users_cell.anglesLap);
subplot(1,2,2)
plot(angles_real);

Indexa=users_cell;

end

