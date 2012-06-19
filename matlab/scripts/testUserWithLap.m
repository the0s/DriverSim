%%provides plots 
plotting = 'n';
all_struct=struct('violaris',[],'theo',[],'kotsios',[],'loizos',[],'xristos',[]);
all_struct_bad=struct('violaris',[],'theo',[],'kotsios',[],'loizos',[],'xristos',[]);

%[ Indexa ] = lap_structure( 'newlap-golf1.txt', 60,18); %new lap
%data_laps_newtrack;

%[ Indexa ] = lap_structure( 'lap2-golf1.txt', 60,18);
load('old_track_ANGLES.mat') %same as function above

%data_laps;
%data_laps2;
data_laps12; 

user_merge_vectors =20; %default =20
user_merge_angles= 20;   %default =12

[user_filenames, user_numbers] = UserDataDecimation(1,filenames,numbers, classnum);
                              
 Model_Group=cell(0); 
 Model_Group_Bad=cell(0);
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell User_Cell_Bad] = ModelCreation(Indexa_new);
           Model_Group = ModelGroupCreation(User_Cell,Model_Group);
           Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
        end
   end
 end
all_struct.theo = Model_Group; 
all_struct_bad.theo = Model_Group_Bad;  

[user_filenames, user_numbers] = UserDataDecimation(0,filenames,numbers, classnum);
%user_filenames =[];
 Model_Group=cell(0); 
 Model_Group_Bad=cell(0);
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell User_Cell_Bad] = ModelCreation(Indexa_new);
           Model_Group = ModelGroupCreation(User_Cell,Model_Group);
           Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
        end
   end
 end
all_struct.violaris = Model_Group;      
all_struct_bad.violaris = Model_Group_Bad;

[user_filenames, user_numbers] = UserDataDecimation(2,filenames,numbers, classnum);
%user_filenames =[];
 Model_Group=cell(0); 
 Model_Group_Bad=cell(0);
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell User_Cell_Bad] = ModelCreation(Indexa_new);
           Model_Group = ModelGroupCreation(User_Cell,Model_Group);
           Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
        end
   end
 end
all_struct.kotsios = Model_Group; 
all_struct_bad.kotsios = Model_Group_Bad; 


[user_filenames, user_numbers] = UserDataDecimation(6,filenames,numbers, classnum);
%user_filenames =[];
 Model_Group=cell(0); 
 Model_Group_Bad=cell(0);
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell User_Cell_Bad] = ModelCreation(Indexa_new);
           Model_Group = ModelGroupCreation(User_Cell,Model_Group);
           Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
        end
   end
 end
all_struct.loizos = Model_Group; 
all_struct_bad.loizos = Model_Group_Bad; 

[user_filenames, user_numbers] = UserDataDecimation(7,filenames,numbers, classnum);
%user_filenames =[];
 Model_Group=cell(0); 
 Model_Group_Bad=cell(0);
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell User_Cell_Bad] = ModelCreation(Indexa_new);
           Model_Group = ModelGroupCreation(User_Cell,Model_Group);
           Model_Group_Bad = ModelGroupCreation(User_Cell_Bad,Model_Group_Bad); %take the values user got out of the road
        end
   end
 end
all_struct.xristos = Model_Group; 
all_struct_bad.xristos = Model_Group_Bad;


       