function [ ok ] = plotAssingedRoad( angle, structure, c )
%PLOTASSINGEDROAD Choose an angle from the group structure and plot it on
%the road for check up FOR theo FROM all_struct
%   angle--> row vector of 3 angles

if ~exist('c', 'var')
    c = 2 ;
end

colour={'*g', '*r', '*y', '*b'};

for x=1:size(structure,2)
    if structure{1,x} == angle
        break;
    end
end

for y=1:size(structure{3,x},2)    
 hold on
 plot(structure{3,x}{1,y}(1,:),structure{3,x}{1,y}(3,:),cell2mat(colour(c)));

end

ok='done';
