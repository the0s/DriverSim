function [ parameters ] = raw2model( raw, class )
%RAW2MODEL Summary of this function goes here
%   Detailed explanation goes here

parameters(1,1) = mean(raw(:,1));
parameters(1,2) = mean(raw(:,2));
parameters(1,3) = mean(raw(:,3));
parameters(1,4) = mean(raw(:,4));
parameters(1,5) = max(raw(:,1));
parameters(1,6) = max(raw(:,2));
parameters(1,7) = max(raw(:,3));
parameters(1,8) = max(raw(:,4));
parameters(1,9) = min(raw(:,1));
parameters(1,10) = min(raw(:,2));
parameters(1,11) = min(raw(:,3));
parameters(1,12) = min(raw(:,4));
parameters(1,13) = var(raw(:,1));
parameters(1,14) = var(raw(:,2));
parameters(1,15) = var(raw(:,3));
parameters(1,16) = var(raw(:,4));
parameters(1,17) =  corr(raw(:,1),raw(:,2));
parameters(1,18) =  corr(raw(:,1),raw(:,3));
parameters(1,19) =  corr(raw(:,1),raw(:,4));
parameters(1,20) =  corr(raw(:,2),raw(:,3));
parameters(1,21) =  corr(raw(:,2),raw(:,4));
parameters(1,22) =  corr(raw(:,3),raw(:,4));

q =  cov(raw(:,1),raw(:,2));
parameters(1,23)= q(1,2);
q =  cov(raw(:,1),raw(:,3));
parameters(1,24)= q(1,2);
q =  cov(raw(:,1),raw(:,4));
parameters(1,25)= q(1,2);
q =  cov(raw(:,2),raw(:,3));
parameters(1,26)= q(1,2);
q =  cov(raw(:,2),raw(:,4));
parameters(1,27)= q(1,2);
q =  cov(raw(:,3),raw(:,4));
parameters(1,28)= q(1,2);

parameters(1,29) = mean(raw(:,5));
parameters(1,30) = max(raw(:,5));
parameters(1,31) = min(raw(:,5));
parameters(1,32) = var(raw(:,5));

parameters(1,33) =  corr(raw(:,5),raw(:,1));
parameters(1,34) =  corr(raw(:,5),raw(:,2));
parameters(1,35) =  corr(raw(:,5),raw(:,3));
parameters(1,36) =  corr(raw(:,5),raw(:,4));

q =  cov(raw(:,1),raw(:,5));
parameters(1,37)= q(1,2);
q =  cov(raw(:,2),raw(:,5));
parameters(1,38)= q(1,2);
q =  cov(raw(:,3),raw(:,5));
parameters(1,39)= q(1,2);
q =  cov(raw(:,4),raw(:,5));
parameters(1,40)= q(1,2);

parameters(1,41)= mean(conv(raw(:,5),raw(:,5)));
parameters(1,42)= mean(conv(raw(:,5),raw(:,4)));
parameters(1,43)= mean(conv(raw(:,5),raw(:,3)));
parameters(1,44)= mean(conv(raw(:,5),raw(:,2)));
parameters(1,45)= mean(conv(raw(:,5),raw(:,1)));
parameters(1,46)= mean(conv(raw(:,4),raw(:,4)));
parameters(1,47)= mean(conv(raw(:,4),raw(:,3)));
parameters(1,48)= mean(conv(raw(:,4),raw(:,2)));
parameters(1,49)= mean(conv(raw(:,4),raw(:,1)));
parameters(1,50)= mean(conv(raw(:,3),raw(:,3)));
parameters(1,51)= mean(conv(raw(:,3),raw(:,2)));
parameters(1,52)= mean(conv(raw(:,3),raw(:,1)));
parameters(1,53)= mean(conv(raw(:,2),raw(:,2)));
parameters(1,54)= mean(conv(raw(:,2),raw(:,1)));
parameters(1,55)= mean(conv(raw(:,1),raw(:,1)));

parameters(1,56)= var(conv(raw(:,5),raw(:,5)));
parameters(1,57)= var(conv(raw(:,5),raw(:,4)));
parameters(1,58)= var(conv(raw(:,5),raw(:,3)));
parameters(1,59)= var(conv(raw(:,5),raw(:,2)));
parameters(1,60)= var(conv(raw(:,5),raw(:,1)));
parameters(1,61)= var(conv(raw(:,4),raw(:,4)));
parameters(1,62)= var(conv(raw(:,4),raw(:,3)));
parameters(1,63)= var(conv(raw(:,4),raw(:,2)));
parameters(1,64)= var(conv(raw(:,4),raw(:,1)));
parameters(1,65)= var(conv(raw(:,3),raw(:,3)));
parameters(1,66)= var(conv(raw(:,3),raw(:,2)));
parameters(1,67)= var(conv(raw(:,3  ),raw(:,1)));
parameters(1,68)= var(conv(raw(:,2),raw(:,2)));
parameters(1,69)= var(conv(raw(:,2),raw(:,1)));
parameters(1,70)= var(conv(raw(:,1),raw(:,1)));

parameters(1,71) = class;
end

