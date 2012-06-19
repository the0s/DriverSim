function [ index ] = track_decimation( distance, distanceoftrack )
%TRACK_DECIMATION returns the index of the starting and finishing values of
%the track data
%distance --> of track
%   Detailed explanation goes here
distance_of_track = distanceoftrack; %depends on the track!!!!!!!!!!!!!!!!!!!!! put value in parameter
[~,index]=findpeaks(distance,'MINPEAKHEIGHT',distance_of_track);
end

