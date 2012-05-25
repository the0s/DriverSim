function [ indexa ] = anglesOntrack( angles, direction_vectors, position3d ,pos, vectors_merge_no,angles_block_no,plotting)
%ANGLESONTRACK split track into angles and their direction vectors
%   Detailed explanation goes here

if ~exist('plotting', 'var')
    plotting = 'y';
end

block_vect=floor(angles_block_no/2);
block_pos = floor(vectors_merge_no/2) * block_vect;

%for x=1:length(angles)
%indexa{1,x} = angles(x);
%end
%indexa{1}.angles= angles

z=1;
for x=block_vect:block_vect:length(direction_vectors)-block_vect    
dir_vec{1,z} = direction_vectors(:,x-(block_vect-1):x+block_vect);
posi{1,z} = pos(:,x-(block_vect-1):x+block_vect);
z=z+1;
end

z=1;
for x=block_pos:block_pos:length(position3d)-block_pos %SASTOOO ??
pos3d{1,z} = position3d(:,x-(block_pos-1):x+block_pos);    
max_min{1,z} = [min(position3d(1, x-(block_pos-1):x+block_pos)) max(position3d(1, x-(block_pos-1):x+block_pos));
               min(position3d(2, x-(block_pos-1):x+block_pos)) max(position3d(2, x-(block_pos-1):x+block_pos));
               min(position3d(3, x-(block_pos-1):x+block_pos)) max(position3d(3, x-(block_pos-1):x+block_pos))
              ]; 
          
mean_var{1,z} = [mean(position3d(1, x-(block_pos-1):x+block_pos)) var(position3d(1, x-(block_pos-1):x+block_pos));
               mean(position3d(2, x-(block_pos-1):x+block_pos)) var(position3d(2, x-(block_pos-1):x+block_pos));
               mean(position3d(3, x-(block_pos-1):x+block_pos)) var(position3d(3, x-(block_pos-1):x+block_pos))
              ];           

%subplot(2,1,1)
%plot_vector(indexa{2,z},indexa{4,z});
%hold on
%plot3(position3d(1,x-(block_pos-1):x+block_pos),position3d(2,x-(block_pos-1):x+block_pos),position3d(3,x-(block_pos-1):x+block_pos),'b');
%pause
%hold off
z=z+1;
end
indexa=struct('angles',{angles},'direction_vectors',{dir_vec},'position3d',{pos3d},'pos',{posi},'max_min',{max_min}, 'mean_var',{mean_var});

if plotting=='y'
    figure;
    for g=1:1:size(posi,2)
        plot(posi{1,g}(1,:),posi{1,g}(3,:))
        text(posi{1,g}(1,size(posi{1,g},2)),posi{1,g}(3,size(posi{1,g},2)),num2str(round(angles(1,g))),...
        'VerticalAlignment','top',...
        'HorizontalAlignment','left',...
        'color','red',...
        'FontSize',5)
        text(posi{1,g}(1,1),posi{1,g}(3,1),num2str(round(angles(1,g))),...
        'VerticalAlignment','bottom',...
        'HorizontalAlignment','right',...
        'FontSize',8)
        hold on
    end
end

end

