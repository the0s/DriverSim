%%Assigns data from text file "Lap" to variables
 
[A,check, speed, brakes,gas,clutch,gear,distance,time, position3d, acceleration3d,steering, gForceLat,gForceLong,handbrake,lapTime] = RacerToMatlab('kotsios-golf3.txt');
 %A= [position3d; acceleration3d]