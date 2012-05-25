%%provides plots 
plotting = 'n';
all_struct=struct('violaris',[],'theo',[],'kotsios',[],'harold',[],'aadil',[],'yiannis',[],'loizos',[],'xristos',[]);
all_struct_bad=struct('violaris',[],'theo',[],'kotsios',[],'harold',[],'aadil',[],'yiannis',[],'loizos',[],'xristos',[]);
[ Indexa ] = lap_structure( 'lap2-golf1.txt', 60,18);
 
 filenames= { 'theo-last-golf';
            'theo-golf';
            'the0-golf';
            'the0-thu2-golf';
            'theo-thur-golf';
            'theo2203-2golf';
            'theo2203-golf';
            };
 numbers=[4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         9 8 7 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         20 19 17 8 7 6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
         7 6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         ];
     
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
           Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
        end
   end
 end
all_struct.theo = Model_Group; 
all_struct_bad.theo = Model_Group_Bad;  

filenames= {'violaris-golf';
            'violaris2-golf';};
        
filenames={};       

numbers=[9 8 7 6 5 4 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;];
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
           Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
        end
   end
 end
all_struct.violaris = Model_Group;      
all_struct_bad.violaris = Model_Group_Bad;

filenames= {
            'kotsios-golf';          
            'kotsios2203-golf';
           };
       
filenames={}; 

numbers=[5 4 3 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
         14 13 12 11 10 9 8 7 6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0;      
         ];
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
           Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
        end
   end
 end
all_struct.kotsios = Model_Group; 
all_struct_bad.kotsios = Model_Group_Bad; 









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
       