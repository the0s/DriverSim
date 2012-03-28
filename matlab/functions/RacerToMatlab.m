%Convert Racer text to variable arrays
%Author: Theos
%22/02/2012
%Text file data:Speed,brakes,gas,clutch,gear,distance,time, x, y ,z, x-acc, y-acc,z-acc,steering

function [A,check, speed, brakes,gas,clutch,gear,lapdistance,time, position3d, acceleration3d,steering, gForceLat,gForceLong,handbrake,lapTime] = RacerToMatlab(filename)
     
    A = loadRacerFile( filename );
    
    check= A(1,:);
    speed = A(2,:);
    brakes = A(3,:);
    gas = A(4,:);
    clutch = A(5,:);
    gear = A(6,:);
    lapdistance = A(7,:);
    time = A(8,:);
    position3d = A(9:11,:);
    acceleration3d = A(12:14,:);
    steering = A(15,:);
    gForceLat = A(16,:);
    gForceLong= A(17,:);
    handbrake = A(18,:);
    lapTime = max(A(19,:));
 
end    
    