function [ rms_r ] = rms_s( sequence)
%RMS_S find the rms value of a sequence of a signal
%   Detailed explanation goes here

        rms_r = sqrt(mean(sequence.^2));
end

