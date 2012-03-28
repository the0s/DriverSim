function [ usr_input,variance,lapTime ] = user_inputs(filename)
%USER_INPUTS Creates user input model for a certain track
%   Detailed explanation goes here

    Optimal_sampling_rate = 0.1;
    [~,check, speed, brakes,gas,clutch,gear,~,time, position3d, ~,steering, ~,~,handbrake,lapTime] = RacerToMatlab(filename);
    

    time = time/1000;
    
    dt = (time(11)-time(1))/10;
    
    usr_input = [gas; brakes; steering; gear;speed; time;];
    variance=[];
    
    
    %%Sampling faster than 0.1
    samples= round(Optimal_sampling_rate/dt);
    
    if samples>1
        samples_to_average = 2*samples;
        samples_to_overlap = samples;
        [usr_input,variance]=overlap_average(usr_input,samples_to_average,samples_to_overlap);
    end  
    
end

