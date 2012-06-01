function [ User_Cell, User_Cell_Bad ] = ModelCreation( User_Structure )
%MODELCREATION Get a user Structure created by User_structure function and
%returns a cell with the angle before current and future with the user
%inputs


check = cell2mat(User_Structure.user_input(2,:));
angless= User_Structure.anglesLap;

p=0;
q=0;
User_Cell = cell(1);
User_Cell_Bad= cell(1);

%%add first and last --> if everything works !!!! 
%TODO
for x=2:size(User_Structure.user_input,2)-1

    if check(x-1)==0 && check(x)==0 && check(x+1)==0 && angless(x-1)>=0 && angless(x)>=0 && angless(x+1)>=0 
        p=p+1;
        User_Cell{1,p} = [angless(x-1) angless(x) angless(x+1)];
        User_Cell{2,p} = cell2mat(User_Structure.user_input(1,x));
        User_Cell{3,p} = [round(angless(x-1)) round(angless(x)) round(angless(x+1))];
        User_Cell{4,p} = User_Structure.pos{1,x};
        %User_Cell{3,p} = [rounding_angles(angless(x-1),5) rounding_angles(angless(x),5) rounding_angles(angless(x+1),5)];
    else
        q=q+1;
        User_Cell_Bad{1,q} = [angless(x-1) angless(x) angless(x+1)];
        User_Cell_Bad{2,q} = cell2mat(User_Structure.user_input(1,x));
        User_Cell_Bad{3,q} = [round(angless(x-1)) round(angless(x)) round(angless(x+1))];
        User_Cell_Bad{4,q} = User_Structure.pos{1,x};
               
    end

 
end
end

