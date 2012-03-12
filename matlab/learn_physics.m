% Make a point move in the 2D plane
% State = (x y xdot ydot). We only observe (x y).
% Generate data from this process, and try to learn the dynamics back.

% X(t+1) = F X(t) + noise(Q)
% Y(t) = ;H X(t) + noise(R)
y = [position3d ; acceleration3d;speed];
%y = [A(9:14,:);A([2 3],:)];
%x = A(:,:);
ss = 7; % state size
os = 7; % observation size
F = eye(ss);
H = eye(os);
Q = 0.1*eye(ss);
R = 1*eye(os);
initx = y(:,1);
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
max_iter = 50;
[F2, H2, Q2, R2, initx2, initV2, LL] =  learn_kalman(y, F1, H1, Q1, R1, initx1, initV1, max_iter);

