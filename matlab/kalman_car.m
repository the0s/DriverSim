 % Make a point move in the 2D plane
% State = (x y xdot ydot). We only observe (x y).

% This code was used to generate Figure 17.9 of "Artificial Intelligence: a Modern Approach",
% Russell and Norvig, 2nd edition, Prentice Hall, in preparation.

% X(t+1) = F X(t) + noise(Q)
% Y(t) = H X(t) + noise(R)
x = [position3d ; acceleration3d;speed];

ss = 7; % state size
os = 7; % observation size
F = eye(ss);
H = eye(os);
Q = 0.1*eye(ss);
R = 1*eye(os);
initx = x(:,1);
initV = 10*eye(ss);

test = 1:1500;
run('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\learn_physics.m')
F=F2;
H=H2;
Q=Q2;
R=R2;
initx=initx2;
initV=initV2; 
x = [position3d ; acceleration3d;speed];
%seed = 9;
%rand('state', seed);
%randn('state', seed);
%T = 10;
%[x,y] = sample_lds(F, H, Q, R, initx, T);

[xfilt, Vfilt, VVfilt, loglik] = kalman_filter(x, F, H, Q, R, initx, initV);
[xsmooth, Vsmooth] = kalman_smoother(x, F, H, Q, R, initx, initV);

dfilt = x([1 2],:) - xfilt([1 2],:);
mse_filt = sqrt(sum(sum(dfilt.^2)))

dsmooth = x([1 2],:) - xsmooth([1 2],:);
mse_smooth = sqrt(sum(sum(dsmooth.^2)))


figure 
subplot(2,1,1)
hold on
plot3(x(1,:), x(2,:),x(3,:), 'ks-');
plot3(x(1,:), x(2,:),x(3,:), 'g*');
plot3(xfilt(1,:), xfilt(2,:),xfilt(3,:), 'rx:');
%for t=1:T, plotgauss2d(xfilt(9:10,t), Vfilt(9:10, 9:10, t)); end
hold off
legend('true', 'observed', 'filtered', 0)
xlabel('X1')
ylabel('X2')

subplot(2,1,2)
hold on
plot3(x(1,:), x(2,:),x(3,:), 'ks-');
plot3(x(1,:), x(2,:),x(3,:), 'g*');
plot3(xsmooth(1,:), xsmooth(2,:),xsmooth(3,:), 'rx:');
%for t=1:T, plotgauss2d(xsmooth(9:10,t), Vsmooth(9:10, 9:10, t)); end
hold off
legend('true', 'observed', 'smoothed', 0)
xlabel('X1')
ylabel('X2')


figure 
subplot(2,1,1)
hold on
plot3(x(4,:), x(5,:),x(6,:), 'ks-');
plot3(x(4,:), x(5,:), x(6,:),'g*');
plot3(xfilt(4,:), xfilt(5,:),xfilt(6,:), 'rx:');
%for t=1:T, plotgauss2d(xfilt(9:10,t), Vfilt(9:10, 9:10, t)); end
hold off
legend('true', 'observed', 'filtered', 0)
xlabel('X1')
ylabel('X2')

subplot(2,1,2)
hold on
plot3(x(4,:), x(5,:), x(6,:),'ks-');
plot3(x(4,:), x(5,:), x(6,:), 'g*');
plot3(xsmooth(4,:), xsmooth(5,:),xsmooth(6,:), 'rx:');
%for t=1:T, plotgauss2d(xsmooth(9:10,t), Vsmooth(9:10, 9:10, t)); end
hold off
legend('true', 'observed', 'smoothed', 0)
xlabel('X1')
ylabel('X2')




