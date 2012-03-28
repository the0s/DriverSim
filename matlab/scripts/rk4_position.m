%%The RK4 algorithm on finding next state using motion of physics formulae
% Result are same as Euler because acceleration is assumed to be constant
% over the sampling time

clear all
[A,check, speed, brakes,gas,clutch,gear,distance,time, position3d, acceleration3d,steering, gForceLat,gForceLong,handbrake,lapTime] = RacerToMatlab('lap2-golf1.txt');


%%Sampling faster than 0.1
    Optimal_sampling_rate = 0.01;
    dt = ((time(11)-time(1))/10)/1000;
    samples= round(Optimal_sampling_rate/dt);
    
    
    if samples>1
        samples_to_average = 2*samples;
        samples_to_overlap = samples;
        [position3d,variancePOS]=overlap_average(position3d,samples_to_average,samples_to_overlap);
        [acceleration3d,varianceACC]=overlap_average(acceleration3d,samples_to_average,samples_to_overlap);
        [time,varianceTIME]=overlap_average(time,samples_to_average,samples_to_overlap);
    end  
    
    ps=1:3;
    dt = (time(2) - time(1)) / 1000;
    dtsqr =dt^2/2;
    pos(ps,1) = position3d(:,1);
    velo(ps,1) = [0;0;0];
    
    %velEqu = 'velo + acc * dt';
    %velEuler = inline(velEqu)
    %Equation= 'pos + velo * dt + 0.5 * dtsqr * acc';
    %Equation_position = 'velocity_initial + acceleration * dt';
    %eulerEq= inline(Equation)
    for x=2:size(time,2)-10
        dvdt = acceleration3d(ps,x);
        velo(ps,x) = velo(ps,x-1) + dvdt * dt;  
        
        pk1 = velo(ps,x);
        pk2 = velo(ps,x) + dvdt * dt * 0.5;
        pk3 = velo(ps,x) + dvdt * dt * 0.5;
        pk4 = velo(ps,x) + dvdt * dt;
        dpdt = (1/6) * (pk1+ 2*pk2 + 2*pk3 + pk4);
        pos(ps,x)  = pos(ps,x-1) + dpdt * dt;
               
        %pos(ps,x) = eulerEq(acceleration3d(ps,x), dt, dtsqr,  pos(ps,x-1),velo(ps,x-1));
    end
    
    plot3(pos(1,:),pos(2,:),pos(3,:));
    hold on
    plot3(position3d(1,:),position3d(2,:),position3d(3,:),'r'); 