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
     
 %User_Model_Sequences=cell(0);
 x=1;
 for h=1:size(filenames,1)
   for k=1:size(numbers,2)
       if numbers(h,k) ~= 0
           name = strcat(filenames{h}, num2str(numbers(h,k)), '.txt')
           
           [ Indexa2 ] = user_structure( name, 20,12,plotting);
           [Indexa_new] = assing_angles_using_means(Indexa,Indexa2,plotting);
           [User_Cell_Sequence] = ModelCreationHMM(Indexa_new);
           for g=1:size(User_Cell_Sequence,2)
           User_Model_Sequences{x,g} = User_Cell_Sequence{5,g}; 
           end
           x=x+1;
        end
   end
 end
all_struct.theo = User_Model_Sequences; 