function [ ok ] = csvTraincreate( remove_out )
%csvTraincreate Summary of this function goes here
%   Detailed explanation goes here

if ~exist('remove_out', 'var')
    remove_out = 0;
end

data_laps12
%data_laps_newtrack
%data_laps;
%data_laps2;
 
p=1;   

for h=1:size(filenames,1)
   for k=1:size(numbers,2)
       if numbers(h,k) ~= 0
           name = strcat(filenames{h}, num2str(numbers(h,k)), '.txt')
           if remove_out==1
                input = user_inputs_only_on_track(name);
           else
                input = user_inputs(name);
           end;
           param(p,:) = raw2model(input',classnum(1,h));
           p=p+1;
       end
   end
end


%for t=1:size(param,2)-1
%    temp = max(abs(param(:,t)));
%    if temp ~=0
%        param(:,t)= param(:,t)/temp;
%    end
%end
cell2csv('lapsDimR_a.csv', num2cell(param));

end
    