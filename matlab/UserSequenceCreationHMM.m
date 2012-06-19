%%provides plots 
plotting = 'n';
all_struct=struct('violaris',[],'theo',[],'kotsios',[],'loizos',[],'xristos',[]);

%% old lap data
%[ Indexa ] = lap_structure( 'lap2-golf1.txt', 60,18);
%load('old_track_ANGLES.mat') %same as function above
%data_laps;
%data_laps2;
%data_laps12; 

%% new lap
[ Indexa ] = lap_structure( 'newlap-golf1.txt', 60,18); %new lap
data_laps_newtrack;
%%
user_merge_vectors =20;
user_merge_angles= 10;
%%
[user_filenames, user_numbers] = UserDataDecimation(1,filenames,numbers, classnum);
     
 User_Model_Sequences=cell(0);
 x=1;
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell_Sequence] = ModelCreationHMM(Indexa_new);
           for g=1:size(User_Cell_Sequence,2)
           User_Model_Sequences{x,1}{1,g} = User_Cell_Sequence{5,g}; 
           end
           x=x+1;
        end
   end
 end
all_struct.theo = User_Model_Sequences; 


[user_filenames, user_numbers] = UserDataDecimation(0,filenames,numbers, classnum);
      %user_filenames = [];
 User_Model_Sequences=cell(0);
 x=1;
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell_Sequence] = ModelCreationHMM(Indexa_new);
           for g=1:size(User_Cell_Sequence,2)
           User_Model_Sequences{x,1}{1,g} = User_Cell_Sequence{5,g}; 
           end
           x=x+1;
        end
   end
 end
all_struct.violaris = User_Model_Sequences;      

[user_filenames, user_numbers] = UserDataDecimation(2,filenames,numbers, classnum);
%user_filenames = [];
 User_Model_Sequences=cell(0);
 x=1;
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell_Sequence] = ModelCreationHMM(Indexa_new);
           for g=1:size(User_Cell_Sequence,2)
           User_Model_Sequences{x,1}{1,g} = User_Cell_Sequence{5,g}; 
           end
           x=x+1;
        end
   end
 end
all_struct.kotsios = User_Model_Sequences; 


[user_filenames, user_numbers] = UserDataDecimation(6,filenames,numbers, classnum);
    % user_filenames = [];
 User_Model_Sequences=cell(0);
 x=1;
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell_Sequence] = ModelCreationHMM(Indexa_new);
           for g=1:size(User_Cell_Sequence,2)
           User_Model_Sequences{x,1}{1,g} = User_Cell_Sequence{5,g}; 
           end
           x=x+1;
        end
   end
 end
all_struct.loizos = User_Model_Sequences; 

[user_filenames, user_numbers] = UserDataDecimation(7,filenames,numbers, classnum);
      %user_filenames = [];
 User_Model_Sequences=cell(0);
 x=1;
 for h=1:size(user_filenames,2)
   for k=1:size(user_numbers,2)
       if user_numbers(h,k) ~= 0
           name = strcat(user_filenames{h}, num2str(user_numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, user_merge_vectors,user_merge_angles,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell_Sequence] = ModelCreationHMM(Indexa_new);
           for g=1:size(User_Cell_Sequence,2)
           User_Model_Sequences{x,1}{1,g} = User_Cell_Sequence{5,g}; 
           end
           x=x+1;
        end
   end
 end
all_struct.xristos = User_Model_Sequences; 