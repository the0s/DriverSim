function [ param,er,all_struct ] = csvTrainCreateAllAngles ()
%csvTraincreate Summary of this function goes here
%   Detailed explanation goes here


%%provides plots 
plotting = 'n';

[ Indexa ] = lap_structure( 'lap2-golf1.txt', 60,18);
 
filenames= {'violaris-golf';
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
   
 
 angles = {[1,1,0],[1,0,1],[0,1,1],[1,1,1],[1,1,6],[1,6,6],[6,6,21],[6,21,21],[21,21,35],[21,35,35],[35,35,35],[35,35,30],[35,30,30],[30,30,32],[30,32,32],[32,32,14],[32,14,14],[14,14,14],[14,14,7],[14,7,7],[7,7,7],[7,7,18],[7,18,18],[18,18,32],[18,32,32],[32,32,32],[14,14,46],[14,46,46],[46,46,40],[46,40,40],[40,40,20],[24,9,9],[9,9,1],[9,1,1],[1,1,2],[1,2,2],[2,2,2],[2,2,6],[2,6,6],[6,6,31],[6,31,31],[31,31,59],[31,59,59],[59,59,33],[59,33,33],[33,33,2],[33,2,2],[2,2,8],[2,8,8],[8,8,28],[8,28,28],[28,28,14],[28,14,14],[14,14,31],[14,31,31],[31,31,6],[31,6,6],[6,6,6],[6,6,4],[6,4,4],[4,4,5],[4,5,5],[5,5,18],[5,18,18],[18,18,34],[18,34,34],[34,34,34],[34,34,3],[34,3,3],[3,3,1],[3,1,2],[2,2,13],[9,2,2],[2,2,4],[2,4,4],[4,4,19],[4,19,19],[19,19,19],[19,19,10],[19,10,15],[10,15,15],[15,15,25],[15,25,25],[25,25,21],[25,21,21],[21,21,18],[21,18,23],[18,23,23],[23,23,27],[23,27,27],[27,27,9],[27,9,9],[9,9,5],[9,5,6],[5,6,6],[6,6,5],[6,5,4],[5,4,4],[4,4,2],[4,2,1],[2,1,1],[1,0,0],[0,0,0],[0,0,1],[21,21,21],[1,1,12],[9,1,2],[6,4,5],[2,13,13],[19,10,10],[10,10,15],[15,25,21],[21,18,18],[18,18,23],[18,23,27],[6,5,5],[5,5,4],[4,2,2],[2,2,1],[40,40,40],[40,20,20],[20,20,1],[20,1,1],[1,12,12],[12,12,24],[12,24,9],[24,9,1],[33,33,33],[4,5,18],[10,15,25],[9,5,5],[5,5,6],[5,4,2],[46,46,46],[12,24,24],[24,24,9],[8,8,8],[3,3,3],[3,1,1],[9,9,2],[2,4,19],[25,21,18],[20,20,20],[1,12,24],[2,6,31],[59,59,59],[2,13,28],[13,28,28],[28,28,9],[28,9,2],[9,9,9],[5,5,5],[2,8,28],[13,13,28],[30,30,30],[18,18,18],[28,28,28],[31,31,31],[13,28,9],[28,9,9],[15,15,15],[5,6,5],[7,18,32],[31,59,33],[4,4,4],[14,31,6],[6,21,35],[8,28,14],[5,18,34],[34,3,1],[28,14,31],[23,27,9],[1,6,21],[27,27,27],[27,9,5],[13,13,13],[12,12,12];};

 for aX=1:size(angles,2)
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
                   if Model_Group{1,f} == angles{1,aX}
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

    name = strcat('angle', num2str(angles{1,aX}(1,1)),num2str(angles{1,aX}(1,2)),num2str(angles{1,aX}(1,3)), '.csv');
    cell2csv(name, num2cell(param));
 end
end
    