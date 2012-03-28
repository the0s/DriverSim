function [ index ] = track_decimation( distance )
%TRACK_DECIMATION returns the index of the starting and finishing values of
%the track data
%   Detailed explanation goes here
distance_of_track = 2000; %depends on the track!!!!!!!!!!!!!!!!!!!!!
[~,index]=findpeaks(distance,'MINPEAKHEIGHT',distance_of_track);
end

