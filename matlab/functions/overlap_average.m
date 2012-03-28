function [ data, variance ] = overlap_average( data, no, overlap )
%OVERLAP_AVERAGE Average the data give by creating overlapping decimations
%of the data
% data: Any nxm matrix to be averaged
% no  : Number of samples to average
% overlap: Number of samples to overlap each time (overlap < no)

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

