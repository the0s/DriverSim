function [ data, variance ] = overlap_average( data, no, overlap )
%OVERLAP_AVERAGE Summary of this function goes here
%   Detailed explanation goes here

    mn=[];
    vr=[];
    for t = 1:overlap:size(data,2)-no
         matrix = data(:,t:t+no);
         m = mean(matrix,2);
         mn= [mn m];
         v = var(matrix');
         vr = [vr v'];
    end

    data =mn;
    variance= vr;
end

