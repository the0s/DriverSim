function [ user_filenames, user_numbers ] = UserDataDecimation( class_number, filenames, numbers, classnum )
%USERDATADECIMATION used after data_laps... gets a class number and returns the
%variables(textfiles) needed for that person to create the angles
z=1;
user_filenames=cell(0);
user_numbers=[];
for  h=1:size(classnum,2)
    if class_number == classnum(1,h)
        user_filenames{z} = filenames{h};
        user_numbers(z,:) = numbers(h,:);
        z=z+1;
    end
    
end
end

