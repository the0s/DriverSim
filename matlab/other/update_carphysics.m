function [ position,velocity] = update_carphysics( position, velocity, brake , gas, steering, time, acceleration, glat, glong, speed)

%INCOPLETE
%CARPHYSICS Its a function simulating the next movement of the car on user input
%   Detailed explanation goes here
%http://www.asawicki.info/Mirror/Car%20Physics%20for%20Games/Car%20Physics%20for%20Games.html
u= [0;0;0];
br= brake;
C_braking = brake;
EngineForce= gas;
area = 2.2; %area infront of car
Coef_friction= 0.3; %wind tunnel tests
density = 1.29; %density of air
C_drag = 0.5 * Coef_friction * area * density;
C_rr = 30*C_drag;
mass = 100;
g= 9.81;
dt = time; %in seconds
%speed = norm(velocity)
%%simple case  b = c = L/2
mu =1.3;  %mu is the friction coefficient of the tyre. For street tyres this may be 1.0, for racing car tyres this can get as high as 1.5
b=1.5; %b is the distance from CG to front axle
c = 1; % the distance from CG to rear axle
L = 0.3; % L is the wheelbase
h =0.5; %h is the height of the CG
rpm_inters_torque = 5252; %V8 engine found in Corvette
 
 
%%Velocity
velocity = velocity + (dt * acceleration);

%%Car position
position = position + (dt * velocity); 
 
%%Calculate Total Longitudinal Force
F_traction = u * EngineForce;
F_drag = -C_drag * velocity * norm(velocity) ;
F_rr = -C_rr * velocity;
F_braking = u * (-C_braking ) ;

F_long = F_traction + F_braking + F_drag + F_rr;
%F_long = glong;

%%Net FOrce acting on the car
Net_Force = mass * acceleration;






end

