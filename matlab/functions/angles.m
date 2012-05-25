function [ angle_last ,angle_vector_consequtive,angle_cell,angle_sequences] = angles(direction_vectors,block,plotting)
%TRACK_DIVIDER Find the angle between 2 cosecutive vectors
% INPUT
%   angle => a.b = |a|*|b|* cos x
% direction_vectors-> series of 3xm direction vectors
% block -> number of direction_vectors to merge-overlap
% OUTPUT
% angle_last -> resulting angle of the block of road
% angle_vector_consequtive -> angles between the direction vectors in  sequence in the
% direction_vector
% angle_cell -> block of angles of different combinations between them
% angle_sequences -> row= block and each column is the result of the
% weighted average of each block column in angle_cell

if ~exist('block', 'var')
    block = 12;
end


if ~exist('plotting', 'var')
    plotting = 'y' ;
end

%%Find all combinations of angles in the block
   z=0; 
  for y= 0:floor(block/2):length(direction_vectors)-block
      for k =(1+y):(block+y-1)
          for j =1:block-(k-y)
            dot_product1 = dot(direction_vectors(:,k), direction_vectors(:,k+j));
            magnitude1 = norm(direction_vectors(:,k)) * norm(direction_vectors(:,k+j));
            angle_result(k-y,j+k-y)=real(acos(dot_product1/magnitude1))* 180 / pi;           
          end
      end
      z=z+1;     
      angle_cell{z}=num2cell(angle_result);
  end   
    
  %%Weight Averaging the combination of angles
  if plotting=='y'
    figure
  end
  s=0;  
  for a=1:length(angle_cell)
    x = cell2mat(angle_cell{1,a});
    newA=[];
    %create a weighted average row from value of the columns
    for f=2:size(x,2)
        newA =[newA weight_average(x(:,f),f-1)] ;  
    end
   s=s+1;     
   angle_sequences(s,:)=(newA);
   if plotting=='y'
   %plot sequences
    t= 1+(s-1)*6: length(newA)+(s-1)*6;   
    
       if mod(s,2)==0
        plot(t,newA,'g'); 
       else
        plot(t,newA,'r'); 
       end
       hold on
    end
   
  end
 
  %Last angle of block is the total result
  %angle_last = angle_sequences(:,block-1)';
  %change to give weighted average of all
  for g=1:size(angle_sequences,1)
    angle_last(g) = weight_average(fliplr(angle_sequences(g,:)),block-1);
  end
  
    if plotting=='y'
      plot(11:6:length(angle_sequences(:,block-1))*6+10,angle_sequences(:,block-1),'b');
      title('Angles Sequences + last angle');
    end
  
  
    for x=1:length(direction_vectors)-1
        dot_product = dot(direction_vectors(:,x), direction_vectors(:,x+1));
        magnitude = norm(direction_vectors(:,x)) * norm(direction_vectors(:,x+1));
        angle_vector_consequtive(x)=real(acos(dot_product/magnitude))* 180 / pi;
    end
    
    if plotting=='y'
        figure    
        plot(1:length(angle_vector_consequtive),angle_vector_consequtive);
        title('Consequtive Angles');
    end
    
end

