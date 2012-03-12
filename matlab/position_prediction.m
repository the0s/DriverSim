[A,check, speed, brakes,gas,clutch,gear,distance,time, position3d, acceleration3d,steering, gForceLat,gForceLong,handbrake,lapTime] = RacerToMatlab('lap-me-again.txt');


pos = position3d(:,1)
%vel = [0;0;0];
dt = (time(2) - time(1)) / 1000;
path = [pos];
%velo = [vel];
%spd = [norm(vel)];
test=[];
for x=1:size(time,2)-1
    %[p,v] = update_carphysics( pos,vel, brakes(:,x) , gas(:,x), steering(:,x), dt, acceleration3d(:,x), gForceLat(:,x),gForceLong(:,x), speed(:,x));
    %v = vel + (dt * acceleration3d(:,x));
    p = pos + (dt * acceleration3d(:,x)*14.0); 
    
    path = [path p];
    %velo = [velo v];
    %spd = [spd norm(vel)];
    pos = p;
    %vel = v;
    test = [test norm(acceleration3d(:,x))*14.00];
end



figure
plot3(path(1,:),path(2,:),path(3,:));
figure
plot3(path(1,:),path(2,:),time);    


mn=[];
vr=[];
for t = 1:5:size(test,2)-10
     matrix = test(:,t:t+10);
     m = mean(matrix,2);
     mn= [mn m];
     v = var(matrix');
     vr = [vr v'];
end
figure
plot(mn);
