function [ ok ] = plotAssingedRoad( angle, structure, c ,extra)
%PLOTASSINGEDROAD Choose an angle from the group structure and plot it on
%the road for check up FOR theo FROM all_struct
%   angle--> row vector of 3 angles

if ~exist('c', 'var')
    c = 2 ;
end

if ~exist('extra', 'var')
    extra = 0 ;
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
hold off

if extra == 1
    for y=1:size(structure{2,x},2)    
     figure;
        subplot(2,3,1)
     plot(structure{2,x}{1,y}(1,:));
          subplot(2,3,2)
     plot(structure{2,x}{1,y}(2,:));
          subplot(2,3,3)
     plot(structure{2,x}{1,y}(3,:));
          subplot(2,3,4)
     plot(structure{2,x}{1,y}(4,:));
          subplot(2,3,5)
     plot(structure{2,x}{1,y}(5,:));
    end
end

ok='done';
end