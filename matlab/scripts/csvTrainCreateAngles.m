function [ param,er,all_struct ] = csvTrainCreateAngles ( angles )
%csvTraincreate creates the csv training data file for classification for the angle inserted

%%provides plots 
plotting = 'n';

[ Indexa ] = lap_structure( 'lap2-golf1.txt', 60,18);
 
filenames= {'violaris-golf'
            'violaris2-golf';
            'theo-last-golf';
            'theo-golf'
            'kotsios-golf';
            'harold-golf';
            'aadil-golf';
            'the0-golf';
            'yiannis-golf';
            'yiannis2-golf';
            'the0-thu2-golf';
            'theo-thur-golf';
            'kotsios2203-golf';
            'loizos2-golf';
            'loizos-golf';
            'theo2203-2golf';
            'theo2203-golf';
            'xristos2-golf';
            'xristos-golf'
           };
  
numbers=[9 8 7 6 5 4 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         9 8 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         20 19 17 8 7 6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
         14 13 12 11 10 9 8 7 6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0;
         21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0 0 0;
         8 7 6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         7 6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0
         ];
     
class={'violaris' 0;
       'violaris' 0;
       'theo' 1;
       'theo' 1;
       'kotsios' 2;
       'harold' 3;
       'aadil' 4;
       'theo' 1;
       'yiannis' 5;
       'loizos' 6;
       'xristos' 7};
   
 classnum=[0 0 1 1 2 3 4 1 5 5 1 1 2 6 6 1 1 7 7];   
  p=1;   
 param=[];
 Model_Group=cell(0);    
 Model_Group_Bad=cell(0);
 
 
 for h=1:size(filenames,1)
   for k=1:size(numbers,2)
       if numbers(h,k) ~= 0
           name = strcat(filenames{h}, num2str(numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, 20,12,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell User_Cell_Bad] = ModelCreation(Indexa_new);
           Model_Group = ModelGroupCreation(User_Cell,Model_Group);
           %Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
           for f=1:size(Model_Group,2)
               if Model_Group{1,f} == angles
                    for o=1:size(Model_Group{2,f},2)
                        er{p,1} = (Model_Group{2,f}{1,o});
                        param(p,:) = raw2model((Model_Group{2,f}{1,o})',classnum(1,h));
                        p=p+1;                       
                    end
                    
               end
           end
           Indexa2=[];
           Indexa_new=[];
           User_Cell =[];
           User_Cell_Bad=[];
           Model_Group=cell(0);
        end
   end
 end
    

for t=1:size(param,2)-1
    temp = max(abs(param(:,t)));
    if temp ~=0
        param(:,t)= param(:,t)/temp;
    end
end
cell2csv('all_angle464040.csv', num2cell(param));

end
    