function [ Indexa ] = assing_angles_using_means( real_structure, users_structure,plotting )
%ASSING_ANGLES Get Real angles and assing them to the user according to the
%coordinates' mean
%   INPUTS
% real_structure --> structure of the road that has the angles with the coordinates
% users_structure --> structure of the user that the angle are goint to be assigned
%OUTPUT
%structure of user_structure input where the angles assinged added to it

if ~exist('plotting', 'var')
    plotting = 'y' ;
end

angles_real = real_structure.angles;
mean_var_real = real_structure.mean_var;
mean_var_user = users_structure.mean_var;


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
    users_structure.anglesLap(1,x) = angles_real(1,ind);  
    subtract_mean(1:3,:)=[];
    distance(1,:)= [];
    
end
if plotting=='y'
    subplot(1,2,1)
    plot(users_structure.anglesLap);
    subplot(1,2,2)
    plot(angles_real);
end
Indexa=users_structure;

end

