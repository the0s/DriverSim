%Convert Racer text to variable arrays + plots them
%Author: Theos
%22/02/2012
%Text file data:Speed,brakes,gas,clutch,gear,distance,time, x, y ,z, x-acc,
%y-acc,z-acc,steering, latitude, longitudinal, handbrake, lapTime

function [A,check, speed, brakes,gas,clutch,gear,lapdistance,time, position3d, acceleration3d,steering, gForceLat,gForceLong,handbrake,lapTime] = RacerToMatlabPlotting(filename)
   
    [A,check, speed, brakes,gas,clutch,gear,lapdistance,time, position3d, acceleration3d,steering, gForceLat,gForceLong,handbrake,lapTime] = RacerToMatlab(filename);

 
    %PLOTTING
    figure
    subplot(3,3,1);
    plot(speed);
    title('Speed');
    
    subplot(3,3,2);
    plot(brakes);
    title('Brake');
    
    subplot(3,3,3);
    plot(gas);
    title('Gas')
    
    subplot(3,3,4);   
    %plot(clutch);
    %title('Clutch')
    plot(steering);
    title('Streering')
    
    subplot(3,3,5);
    plot(gear);
    title('Gear')
    
    subplot(3,3,6);    
    plot(lapdistance);
    title('Distance')
   
    subplot(3,3,7);    
    plot(check);
    title('In-Route')   

    
    %other
    figure
    
    subplot(2,3,1);
    plot3(position3d(1,:),position3d(2,:),position3d(3,:));
    title('Position3d')
     
    subplot(2,3,6);
    plot3(position3d(1,:),position3d(2,:),time);
    title('Position2d')
    
    subplot(2,3,2);    
    plot3(acceleration3d(1,:),acceleration3d(2,:),acceleration3d(3,:));
    title('Acceleration3d')
    
    subplot(2,3,3);    
    plot(gForceLat);
    title('Gforce lattitude')
    
    subplot(2,3,4);    
    plot(gForceLong);
    title('Gforce Longitude')
    
    subplot(2,3,5);    
    plot3(gForceLat,gForceLong,time);
    title('GForce')
    
    %Histograms
    figure
    y = 0:0.0001:1;
    
    subplot(2,2,1);
    hist(brakes,y);
    title('Brake');
    
    subplot(2,2,2);
    hist(gas,y);
    title('Gas')
    
    %subplot(2,2,3);   
    %hist(clutch,y);
    %title('Clutch')
   
    
    subplot(2,2,3);
    x = 0:1:7;
    hist(gear,x);
    title('Gear')
    
    subplot(2,2,4);
    g= 0:0.1:450;
    hist(abs(steering),g);
    title('Steering')
    
    %subplot(2,3,6);   
    %hist(handbrake,y);
    %title('Handbrake') 
end
    
    