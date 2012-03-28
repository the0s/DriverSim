function [ User_Cell ] = ModelCreation( User_Structure )
%MODELCREATION Get a user Structure created by User_structure function and
%returns a cell with the angle before current and future with the user
%inputs

check = cell2num(User_Structure.user_input(2,:));
angless= User_Structure.anglesLap;

p=0;
for x=2:size(User_Structure.user_input,2)-1
    if check(x-1)==0 && check(x)==0 && check(x+1)==0
        p=p+1;
        User_Cell{1,p} = [angless(x-1) angless(x) angless(x+1)];
        User_Cell{2,p} = cell2num(User_Structure.user_input(1,x));
        User_Cell{3,p} = [floor(angless(x-1)) floor(angless(x)) floor(angless(x+1))];
    end
   
       
end
end

