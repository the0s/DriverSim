function [ w_aver ] = weight_average( numbers_vector,n )
%WEIGHT_AVERAGE Weighted average on a vector according to their position
% Higher weight for the first one
%numbers_vector     vector with the numbers to average
%       n           number of vectors to average from that vector

x=n;
temp=0;
weightsum=0;

for g=1:x
        temp = temp + numbers_vector(g)*(x-g+1);
        weightsum = weightsum + (x-g+1);
end
w_aver= temp/weightsum;

end

