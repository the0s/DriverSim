function [ parameters ] = raw2model( raw, class )
%RAW2MODEL Takes a user input and convert it to a model
%  RAW user input from RACE DATA
%  CLASS class of the user for classification

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
parameters(1,20) = corr(raw(:,2),raw(:,3));
parameters(1,21) = corr(raw(:,2),raw(:,4));
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

parameters(1,33) = corr(raw(:,5),raw(:,1));
parameters(1,34) = corr(raw(:,5),raw(:,2));
parameters(1,35) = corr(raw(:,5),raw(:,3));
parameters(1,36) = corr(raw(:,5),raw(:,4));

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

parameters(1,56)= sum(abs(fft(raw(:,5))));
parameters(1,57)= sum(abs(fft(raw(:,4))));
parameters(1,58)= sum(abs(fft(raw(:,3))));
parameters(1,59)= sum(abs(fft(raw(:,2))));
parameters(1,60)= sum(abs(fft(raw(:,1))));
parameters(1,61)= sum(abs(ifft(raw(:,5))));
parameters(1,62)= sum(abs(ifft(raw(:,4))));
parameters(1,63)= sum(abs(ifft(raw(:,3))));
parameters(1,64)= sum(abs(ifft(raw(:,2))));
parameters(1,65)= sum(abs(ifft(raw(:,1))));
parameters(1,66)= rms_s(raw(:,1));
parameters(1,67)= rms_s(raw(:,2));
parameters(1,68)= rms_s(raw(:,3));
parameters(1,69)= rms_s(raw(:,4));
parameters(1,70)= rms_s(raw(:,5));

parameters(1,71)= mean(diff(raw(:,1),1));
parameters(1,72)= mean(diff(raw(:,2),1));
parameters(1,73)= mean(diff(raw(:,3),1));
parameters(1,74)= mean(diff(raw(:,4),1));
parameters(1,75)= mean(diff(raw(:,5),1));

parameters(1,76)= mean(diff(raw(:,1),2));
parameters(1,77)= mean(diff(raw(:,2),2));
parameters(1,78)= mean(diff(raw(:,3),2));
parameters(1,79)= mean(diff(raw(:,4),2));
parameters(1,80)= mean(diff(raw(:,5),2));

parameters(1,81) = mean(ifft(log(abs(fft(raw(:,1))))));
parameters(1,82) = mean(ifft(log(abs(fft(raw(:,2))))));
parameters(1,83) = mean(ifft(log(abs(fft(raw(:,3))))));
parameters(1,84) = mean(ifft(log(abs(fft(raw(:,4))))));
parameters(1,85) = mean(ifft(log(abs(fft(raw(:,5))))));

parameters(1,86)= mean(diff(ifft(log(abs(fft(raw(:,1))))),1));
parameters(1,87)= mean(diff(ifft(log(abs(fft(raw(:,2))))),1));
parameters(1,88)= mean(diff(ifft(log(abs(fft(raw(:,3))))),1));
parameters(1,89)= mean(diff(ifft(log(abs(fft(raw(:,4))))),1));
parameters(1,90)= mean(diff(ifft(log(abs(fft(raw(:,5))))),1));

parameters(1,91)= mean(diff(ifft(log(abs(fft(raw(:,1))))),2));
parameters(1,92)= mean(diff(ifft(log(abs(fft(raw(:,2))))),2));
parameters(1,93)= mean(diff(ifft(log(abs(fft(raw(:,3))))),2));
parameters(1,94)= mean(diff(ifft(log(abs(fft(raw(:,4))))),2));
parameters(1,95)= mean(diff(ifft(log(abs(fft(raw(:,5))))),2));

parameters(1,96) = kurtosis(raw(:,1));
parameters(1,97) = kurtosis(raw(:,2));
parameters(1,98) = kurtosis(raw(:,3));
parameters(1,99) = kurtosis(raw(:,4));

parameters(1,100) = skewness(raw(:,1));
parameters(1,101) = skewness(raw(:,2));
parameters(1,102) = skewness(raw(:,3));
parameters(1,103) = skewness(raw(:,4));

parameters(1,104) = kurtosis(raw(:,5));
parameters(1,105) = skewness(raw(:,5));

for x = 1:size(parameters,2)
    if isnan(parameters(1,x)) == 1
        parameters(1,x)=0;
    end
    if isinf(parameters(1,x)) == 1
        parameters(1,x)=0;
    end
end

if exist('class', 'var')
    parameters(1,size(parameters,2)+1) = class;
end



end

