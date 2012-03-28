function [ position ] = carphysics( initial_pos, brake , gas, steering, time, acceleration, glat, glong, speed, rpm)
%INCOPLETE
%CARPHYSICS Its a function simulating the next movement of the car on user input
%   Detailed explanation goes here
%http://www.asawicki.info/Mirror/Car%20Physics%20for%20Games/Car%20Physics%20for%20Games.html
u= gas;
br= brake;
C_braking = 10;
EngineForce= 10;
area = 2.2; %area infront of car
Coef_friction= 0.3; %wind tunnel tests
density = 1.29; %density of air
C_drag = 0.5 * Coef_friction * area * density;
C_rr = 30*C_drag;
velocity= speed;
mass = 100;
g= 9.81;
position = initial_pos;
dt = time; %in seconds
%speed = norm(velocity)
%%simple case  b = c = L/2
mu =1.3  %mu is the friction coefficient of the tyre. For street tyres this may be 1.0, for racing car tyres this can get as high as 1.5
b=1.5 %b is the distance from CG to front axle
c = 1 % the distance from CG to rear axle
L = 0.3 % L is the wheelbase
h =0.5 %h is the height of the CG
 rpm_inters_torque = 5252 %V8 engine found in Corvette
 
%%Calculate Total Longitudinal Force
F_traction = u * EngineForce;
F_drag = -C_drag * velocity * norm(velocity) ;
F_rr = -C_rr * velocity;
if (speed ==0)
    F_braking = 0;
else
    F_braking = -C_braking * br;
end
F_long = F_traction + F_braking + F_drag + F_rr;
%F_long = glong;

%%Acceleration
acceleration = F_long / mass;

%%Velocity
velocity = velocity + (dt * acceleration);

%%Car position
position = position + (dt * velocity);

%%Weight Trasnfer
%%weight distribution dramatically affects the maximum traction force per wheel
%friction limit for a wheel that is proportional to the load on that wheel
W = mass * g;
W_front = (c/L) * W - (h/L)*mass*acceleration;
W_rear = (b/L) * W + (h/L)*mass*acceleration;
F_max = mu * W;

%%Engine force
%Fdrive = u * Tengine * xg * xd * n / Rw 
%    where 
u_orien= [1 1];% ??   u_orien is a unit vector which reflects the car's orientation, 
Tengine= 448; %    Tengine is the torque of the engine at a given rpm,
xg= 2.66;%    xg is the gear ratio,
xd=3.42;%    xd is the differential ratio,
tr = 0.7;%    tr is transmission efficiency and 
Rw=0.34%    Rw is wheel radius.  
rpm ;%wheel rotation rate * gear ratio * differential ratio * 60 / 2 pi, 60 / 2 pi is a conversion factor to get from rad/s to revolutions per minute
hp = torque * rpm / rpm_inters_torque;
F_drive= u_orien * Tengine * xg * xd * tr / Rw

%%Slip ratio and traction force
%Slip ratio is zero for a free rolling wheel.  For a car braking with locked wheels the slip ratio is -1, and a car accelerating forward has a positive slip ratio. 
slip = (angular_v * Rw *longitutinal_v)/norm(longitutinal_v);
%!!!!SEE MORE

%%Turning
%LOW SPEED
circle_radius = L / sin(steering_angle);
angular_velocity = velocity / circle_radius;%(the velocity vector always points in the car direction)
%HIGH SPEED - no longer assume that wheels are moving in the direction they're pointing
F_lateral = Ca * alpha
%There are three contributors to the slip angle of the wheels: the sideslip angle of the car, the angular rotation of the car around the up axis (yaw rate) and, for the front wheels, the steering angle.
sideslip_angle = arctan(v(2)/v(1));

end

