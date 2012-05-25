function [ Indexa ] = assing_angles_using_means( real_cell, users_cell,plotting )
%ASSING_ANGLES Get Real angles and assing them to the user according to the
%coordinates
%   Detailed explanation goes here
if ~exist('plotting', 'var')
    plotting = 'y' ;
end

angles_real = real_cell.angles;
mean_var_real = real_cell.mean_var;
mean_var_user = users_cell.mean_var;


for x=1:size(mean_var_user,2)
    for y=1:size(mean_var_real,2)
        %if y as well gives problems with the height **might need newer
        %method
       subtract_mean(1:3,y) = mean_var_user{1,x}(:,1) - mean_var_real{1,y}(:,1);
       distance(1,y) = norm(subtract_mean(1:3,y));
       
       %use fisher discriminant --NO
       %subtract_mean(1:3,y) = mean_var_user{1,x}(:,1) - mean_var_real{1,y}(:,1);
       %distance1(1,y) = (norm(subtract_mean(1:3,y)))^2;
        
       %add_var(1:3,y) = mean_var_user{1,x}(:,2) + mean_var_real{1,y}(:,2);
       %distance2(1,y) = (norm(add_var(1:3,y)))^2;
        
       %distance(1,y) = distance1(1,y)/distance2(1,y);
       
       
    end
    
    [dis,ind] = min(distance);
    users_cell.anglesLap(1,x) = angles_real(1,ind);  
    subtract_mean(1:3,:)=[];
    distance(1,:)= [];
    
end
if plotting=='y'
    subplot(1,2,1)
    plot(users_cell.anglesLap);
    subplot(1,2,2)
    plot(angles_real);
end
Indexa=users_cell;

end

