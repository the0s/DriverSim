%find the parameters of position and acceleration by forcing the manual
%kalman parameter data


% Make a point move in the 2D plane
% State = (x y xdot ydot). We only observe (x y).
% Generate data from this process, and try to learn the dynamics back.



Q(1:3,1)= position3d(:,1);
Q(4:6,1)= acceleration3d(:,1);
A = [1 0 0 dt 0 0;0 1 0  0 dt 0;0 0 1 0 0 dt;0 0 0 1 0 0;0 0 0 0 1 0;0 0 0 0  0 1];
B = [dt^2/2  0 0;0 dt^2/2 0; 0 0 dt^2/2;dt 0 0; 0 dt 0 ; 0 0 dt];
C = [1 0 0 0 0 0 ; 0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0; 0 0 0 0 0 0];

% X(t+1) = F X(t) + noise(Q)
% Y(t) = ;H X(t) + noise(R)

ss = 6; % state size
os = 6; % observation size
F = A;
H = C;
Q = 0.1*eye(ss);
R = 1*eye(os);
initx = Q(1:6,1);
initV = 10*eye(ss);

% Initializing the params to sensible values is crucial.
% Here, we use the true values for everything except F and H,
% which we initialize randomly (bad idea!)
% Lack of identifiability means the learned params. are often far from the true ones.
% All that EM guarantees is that the likelihood will increase.
F1 = F;%randn(ss,ss);
H1 = H;%randn(os,ss);
Q1 = Q;
R1 = R;
initx1 = initx;
initV1 = initV;
max_iter = 100;
[F2, H2, Q2, R2, initx2, initV2, LL] =  learn_kalman([position3d;acceleration3d], F1, H1, Q1, R1, initx1, initV1, max_iter);

