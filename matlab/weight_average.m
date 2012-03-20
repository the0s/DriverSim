function [ w_aver ] = weight_average( numbers_vector,n )
%WEIGHT_AVERAGE Summary of this function goes here
%   Detailed explanation goes here


x=n;

temp=0;
weightsum=0;

for g=1:x
        temp = temp + numbers_vector(g)*(x-g+1);
        weightsum = weightsum + (x-g+1);
end
w_aver= temp/weightsum;

end

