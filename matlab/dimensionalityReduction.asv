function [ mappedX, mapping] = dimensionalityReduction( csvfile, method, no_to_keep, dimension )
%DIMENSIONALITYREDUCTION reduces the dimension of data 
%method to use to reduce the dimensions
%csvfile file to get data
%no_to_keep from the end the number of columns to keep as it is
%dimension number of coefficients to leave
data =load(csvfile);
    len = size(data,2);
    X= data(:,1:len-no_to_keep);

if exist('dimension', 'var')
    no_dims=dimension;
else
    no_dims = round(intrinsic_dim(X, 'MLE'));
end
	
    [mappedX, mapping] = compute_mapping(X, method, no_dims);
    
    if no_to_keep ~=0
        mappedX = [mappedX data(:,len-no_to_keep : len)];
    end
     
    name = strcat(csvfile(1:size(csvfile,2)-4),method,num2str(no_dims), '.csv')
    
    cell2csv(name, num2cell(mappedX));
end

