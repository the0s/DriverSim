function [ User_Cell_Sequence ] = ModelCreationHMM( User_Structure )
%MODELCREATIONHMM Get a user Structure created by User_structure function and
%returns a cell with the angle before current and future with the user
%inputs and feature vectors FOR HMM


check = cell2mat(User_Structure.user_input(2,:));
angless= User_Structure.anglesLap;

p=0;
User_Cell_Sequence = cell(1);

%%add first and last --> if everything works !!!! 
%TODO
for x=2:size(User_Structure.user_input,2)-1
        p=p+1;
        User_Cell_Sequence{1,p} = [angless(x-1) angless(x) angless(x+1)];            
        User_Cell_Sequence{2,p} = cell2mat(User_Structure.user_input(1,x));
        User_Cell_Sequence{3,p} = [round(angless(x-1)) round(angless(x)) round(angless(x+1))];
        User_Cell_Sequence{4,p} = User_Structure.pos{1,x};
        User_Cell_Sequence{5,p} = raw2modelHMM(cell2mat(User_Structure.user_input(1,x))', [round(angless(x-1)) round(angless(x)) round(angless(x+1))]);
        %User_Cell{3,p} = [rounding_angles(angless(x-1),5) rounding_angles(angless(x),5) rounding_angles(angless(x+1),5)];
 
end
end

