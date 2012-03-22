function [ ok ] = csvTraincreate( remove_out )
%csvTraincreate Summary of this function goes here
%   Detailed explanation goes here

if ~exist('remove_out', 'var')
    remove_out = 0;
end

filenames= {'violaris-golf';
            'violaris2-golf';
            'theo-last-golf';
            'theo-golf';
            'kotsios-golf';
            'harold-golf';
            'aadil-golf';
            'the0-golf';
            'yiannis-golf';
            'yiannis2-golf';
            'the0-thu2-golf';
            'theo-thur-golf'
           };
  
numbers=[9 8 7 6 5 4 2 0 0 0 0;
         5 4 3 2 1 0 0 0 0 0 0;
         4 3 2 1 0 0 0 0 0 0 0;
         9 8 7 0 0 0 0 0 0 0 0;
         5 4 3 2 1 0 0 0 0 0 0;
         6 5 4 3 2 1 0 0 0 0 0;
         4 3 2 1 0 0 0 0 0 0 0;
         1 0 0 0 0 0 0 0 0 0 0;
         2 1 0 0 0 0 0 0 0 0 0;
         1 0 0 0 0 0 0 0 0 0 0;
         5 4 3 2 1 0 0 0 0 0 0;
         20 19 17 8 7 6 5 4 3 2 1
         ];
     
class={'violaris' 0;
       'violaris' 0;
       'theo' 1;
       'theo' 1;
       'kotsios' 2;
       'harold' 3;
       'aadil' 4;
       'theo' 1;
       'yiannis' 5};
   
 classnum=[0 0 1 1 2 3 4 1 5 5 1 1];
 
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




for t=1:size(param,2)-1
    temp = max(abs(param(:,t)));
    if temp ~=0
        param(:,t)= param(:,t)/temp;
    end
end
cell2csv('test2.csv', num2cell(param));

end
    