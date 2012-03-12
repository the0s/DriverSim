function [ usr_input,variance ] = user_inputs(filename)
%USER_INPUTS Summary of this function goes here
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
    clutch = A(5,:);
    time = A(8,:)/1000;
    
    dt = (time(11)-time(1))/10;
    
    usr_input = [gas; brake; steering; gear; time;];
    variance=[];
    
    
    %%Sampling faster than 0.1
    samples= round(Optimal_sampling_rate/dt);
    
    if samples>1
        samples_to_average = 2*samples;
        samples_to_overlap = samples;
        [usr_input,variance]=overlap_average(usr_input,samples_to_average,samples_to_overlap);
    end  
    
end

