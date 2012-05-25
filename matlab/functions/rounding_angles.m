function [ rounded_angle ] = rounding_angles( exact_angle, space )
%ROUNDING_ANGLES Get an angle and return an identification angle to a range according to
%that angle
%   exact_angle-> to be assigned to a range
%   space-> how big is the range that the angle will emmerge

id = 0:space:360;
if exact_angle == -1
    rounded_angle =-1;
else
    for n = 1:size(id,2)-1;
        if id(n)<= exact_angle && id(n+1)>exact_angle
            rounded_angle= id(n);
            break;
        end
    end
end

end


