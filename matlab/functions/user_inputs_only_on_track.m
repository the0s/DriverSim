function [ usr_input,variance,lapTime ] = user_inputs_only_on_track( filename )
%USER_INPUTS_ONLY_ON_TRACK Summary of this function goes here
%   Detailed explanation goes here

    Optimal_sampling_rate = 0.1;

    [~,check, speed, brakes,gas,clutch,gear,~,time, position3d, ~,steering, ~,~,handbrake,lapTime] = RacerToMatlab(filename);
    time = time/1000;
    
    dt = (time(11)-time(1))/10;
    
     
    usr_input = [gas; brakes; steering; gear;speed; time; check];
    
       
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

