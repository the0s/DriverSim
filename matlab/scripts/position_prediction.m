%Manual Kalman ninja on position and acceleration

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

predic_var = [];
p=1:6;
%ps=1:3;
dt = (time(2) - time(1)) / 1000;
dtsqr =dt^2/2;
%dtsqr = 0.1; %test
%path(ps,1) = position3d(:,1);
%velo(ps,1) = [0;0;0];

Q(1:3,1)= position3d(:,1);
Q(4:6,1)= [0;0;0];

S(1:3,1)= position3d(:,1);
S(4:6,1)= [0;0;0];

A = [1 0 0 dt 0 0;
     0 1 0 0 dt 0;
     0 0 1 0 0 dt;
     0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1];
B = [dtsqr  0 0;0 dtsqr 0; 0 0 dtsqr;dt 0 0; 0 dt 0 ; 0 0 dt];




%C = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 1 0 0 0];
 C = [1 1 1 0 0 0];
Ex = eye(6);% Ex convert the process noise (stdv) into covariance matrix
P = Ex; % estimate of initial position variance (covariance matrix)
Ez = .0025;


for x=2:size(time,2)
    %[p,v] = update_carphysics( pos,vel, brakes(:,x) , gas(:,x), steering(:,x), dt, acceleration3d(:,x), gForceLat(:,x),gForceLong(:,x), speed(:,x));
    %velo(ps,x) = velo(ps,x-1) + (dt * acceleration3d(:,x));
    %path(ps,x) =  path(ps,x-1) + dt*velo(ps,x-1) + (((dt^2)/2) * acceleration3d(:,x)); 
    
    S(p,x) = A * S(p,x-1) + B * acceleration3d(:,x);
    
    % Predict next state of the car with the last state and predicted motion.
    Q(p,x) = A * Q(p,x-1) + B * acceleration3d(:,x);
    %Q(p,x) = Q(p,x) * 1.000+ [0.5561; 0.0929;0.1852; 0; 0; 0]; %fix
    Q(p,x) = Q(p,x);
    %predict next covariance
	P = A * P * A' + Ex;
    %predic_var = [predic_var; P] ;
    % Kalman Gain
	%K = P*C'*inv(C*P*C'+Ez);
    K = P*C'/(C*P*C'+Ez);
    
    % Update the state estimate.
    %if mod(x,2)==0
    magic(p,x) = K .* ([position3d(:,x);0;0;0] - C' .* Q(p,x));
    Q(p,x) = Q(p,x) + magic(p,x);
    %end
    %Q(p,x) = Q(p,x) + K .* ([position3d(:,x);0;0;0] - C' .* Q(p,x));
  
    %Q(p,x) = Q(p,x) + K .* ( Q(p,x) - C' .* [position3d(:,x);0;0;0]); test
    % update covariance estimation.
	P =  (eye(6)-K*C)*P;
    
end


figure 
plot3(S(1,:),S(2,:),S(3,:));
figure 
plot3(Q(1,:),Q(2,:),Q(3,:));
hold on
plot3(position3d(1,:),position3d(2,:),position3d(3,:),'r');    
figure
plot(magic');
%figure 
%plot3(velo(1,:),velo(2,:),velo(3,:));

