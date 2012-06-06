function [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angle, classnum, p )
%ANGLEMODELFEATURESCREATOR gets a group model of a user and returns lines
%of features vectors for a specified angle
%USED BY csvTrainCreateAllAnglesOpt
            for f=1:size(Model_Group,2)
                   if Model_Group{1,f} == angle
                        for o=1:size(Model_Group{2,f},2)
                            er{p,1} = (Model_Group{2,f}{1,o});
                            param(p,:) = raw2model((Model_Group{2,f}{1,o})',classnum);
                            p=p+1;                       
                        end

                   end
            end
end



