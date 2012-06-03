function [ w_average ] = weight_average( vector_no,n )
%WEIGHT_AVERAGE Weighted average on a vector according to their position
%(Higher weights for the numbers at start of the array)
%vector_no --> vector with the numbers to average
%n --> number of vectors to average from that vector (vectors with zero
%paddings should not be included in the weights)
    x=n;
    temp=0;
    weightsum=0;

    for g = 1 : x
            temp = temp + vector_no(g)*(x-g+1);
            weightsum = weightsum + (x-g+1);
    end
    w_average = temp/weightsum;

end

