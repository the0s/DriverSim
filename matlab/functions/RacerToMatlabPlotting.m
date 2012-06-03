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
    plot(time,speed);
    title('Speed');
    xlabel('ms');
    ylabel('km/h');
    
    subplot(3,3,2);
    plot(time,brakes);
    title('Brake');
    xlabel('ms');
    ylabel('Force');    
    
    subplot(3,3,3);
    plot(time, gas);
    title('Gas')
    xlabel('ms');
    ylabel('Force');
    
    subplot(3,3,4);   
    %plot(clutch);
    %title('Clutch')
    plot(time,steering);
    title('Streering')
    xlabel('ms');
    ylabel('angle');
    
    subplot(3,3,5);
    plot(time,gear);
    title('Gear')
    xlabel('ms');
    ylabel('gear');
    
    subplot(3,3,6);    
    plot(time,lapdistance);
    title('Distance')
    xlabel('ms');
    ylabel('metres');
   
    subplot(3,3,7);    
    plot(time,check,'*');
    title('In-Route')
    xlabel('ms');
    ylabel('Boolean');

    
    %other
    figure  
    subplot(2,3,1);
    plot3(position3d(1,:),position3d(2,:),position3d(3,:));
    title('Position-3d');
    xlabel('x');
    ylabel('y');
    zlabel('z');
     
    subplot(2,3,6);
    plot3(time, position3d(1,:),position3d(3,:));
    title('Position2d');
    ylabel('x');
    zlabel('z');
    xlabel('time');
    
    subplot(2,3,2);    
    plot3(acceleration3d(1,:),acceleration3d(2,:),acceleration3d(3,:));
    title('Acceleration3d');
    xlabel('x');
    ylabel('y');
    zlabel('z');
    
    subplot(2,3,3);    
    plot(time, gForceLat);
    title('Gforce Latitude');
    ylabel('force');
    xlabel('time');
    
    subplot(2,3,4);    
    plot(time,gForceLong);
    title('Gforce Longitude');
    ylabel('force');
    xlabel('time');  
    
    subplot(2,3,5);    
    plot3(time, gForceLat,gForceLong);
    title('GForce')
    xlabel('ms')
    ylabel('Lat-force');
    zlabel('Long-force');
    
    %Histograms
    figure
    y = 0:0.0001:1;
    
    subplot(2,2,1);
    hist(brakes,y);
    title('Brake Hist');
    ylabel('force');
    
    subplot(2,2,2);
    hist(gas,y);
    title('Gas Hist')
    ylabel('force');
    %subplot(2,2,3);   
    %hist(clutch,y);
    %title('Clutch')
   
    
    subplot(2,2,3);
    x = 0:1:7;
    hist(gear,x);
    title('Gear Hist')
    ylabel('gear');
    
    subplot(2,2,4);
    g= 0:0.1:450;
    hist(abs(steering),g);
    title('Steering Hist')
    ylabel('angle');
    %subplot(2,3,6);   
    %hist(handbrake,y);
    %title('Handbrake') 
end
    
    