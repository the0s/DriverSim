function [ Model_Group ] = ModelGroupCreation(Model_Cell,Model_Group )
%MODELGROUPCREATION Get a file from ModelCretion to group parameters with
%same angle transition
%%BETTER implemented with hash tables

if size(Model_Cell{1,1}) > 0 %avoid error with empty cell by avoiding extra calculations
 
    
    for x=1:size(Model_Cell,2) 
    %hash_index=strcat(num2str(Model_Cell{3,x}(1,1)),',',num2str(Model_Cell{3,x}(1,2)),',',num2str(Model_Cell{3,x}(1,3)) );
    p=size(Model_Group,2); %check current sze fo model group
        if size(Model_Group,2)==0
            p=1;
            Model_Group{1,p} = Model_Cell{3,x};
            Model_Group{2,p} = cell(1);
            Model_Group{2,p}{1,1} = Model_Cell{2,x};
            Model_Group{3,p} = cell(1);
            Model_Group{3,p}{1,1} = Model_Cell{4,x};

        else
            for y=1:size(Model_Group,2)
                if Model_Cell{3,x} == Model_Group{1,y}
                   not_in=0;

                   Model_Group{2,y}{1,size(Model_Group{2,y},2)+1} = Model_Cell{2,x};
                   Model_Group{3,y}{1,size(Model_Group{3,y},2)+1} = Model_Cell{4,x};
                   %ADD
                   break;
                else
                    not_in=1;
                end
            end
            if not_in == 1
                p=p+1;
                Model_Group{1,p} = Model_Cell{3,x};
                Model_Group{2,p} = cell(1);
                Model_Group{2,p}{1,1} = Model_Cell{2,x};
                Model_Group{3,p} = cell(1);
                Model_Group{3,p}{1,1} = Model_Cell{4,x};            
            end

        end



    end
    
end





end

