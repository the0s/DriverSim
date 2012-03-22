function [ usr_input,variance ] = user_inputs_only_on_track( filename )
%USER_INPUTS_ONLY_ON_TRACK Summary of this function goes here
%   Detailed explanation goes here

    Optimal_sampling_rate = 0.1;

    fid = fopen(filename);
    A = fscanf(fid,'%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g',[19, inf] );
    fclose(fid);
    
    brake = A(3,:);
    gas = A(4,:);
    steering = A(15,:);    
    gear = A(6,:);
    handbrake = A(18,:);
     speed = A(2,:);
    clutch = A(5,:);
    time = A(8,:)/1000;
    
    dt = (time(11)-time(1))/10;
    
    check = A(1,:);
    
    usr_input = [gas; brake; steering; gear;speed; time; check];
    
       
    variance=[];
    
    
    %%Sampling faster than 0.1
    samples= round(Optimal_sampling_rate/dt);
    
    if samples>1
        samples_to_average = 2*samples;
        samples_to_overlap = samples;
        [usr_input,variance]=overlap_average(usr_input,samples_to_average,samples_to_overlap);
    end  
    
    p=1;
    for k = 1:size(usr_input,2)
        if usr_input(7,k) == 0 
            temp(:,p) = usr_input(:,k);
            p=p+1;
        end   
    end
    usr_input=temp;
    
end

