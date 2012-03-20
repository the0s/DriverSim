function [ indexa ] = anglesOntrack( angles, direction_vectors, position3d ,pos)
%ANGLESONTRACK split track into angles and their direction vectors
%   Detailed explanation goes here

block_vect=6;
block_pos = 25*block_vect;

for x=1:length(angles)
indexa{1,x} = angles(x);
end
z=1;
for x=block_vect:block_vect:length(direction_vectors)-block_vect    
indexa{2,z} = direction_vectors(:,x-(block_vect-1):x+block_vect);
indexa{4,z} = pos(:,x-(block_vect-1):x+block_vect);
z=z+1;
end

z=1;
for x=block_pos:block_pos:length(position3d)-block_pos %SASTOOO
indexa{3,z} = position3d(:,x-(block_pos-1):x+block_pos);    


%subplot(2,1,1)
plot_vector(indexa{2,z},indexa{4,z});
hold on
plot3(position3d(1,x-(block_pos-1):x+block_pos),position3d(2,x-(block_pos-1):x+block_pos),position3d(3,x-(block_pos-1):x+block_pos),'b');
pause
hold off
z=z+1;
end



end

