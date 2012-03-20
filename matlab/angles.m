function [ angle_vector,angle_vector1,tess,last ] = angles(direction_vectors)
%TRACK_DIVIDER Find the angle between 2 cosecutive vectors
%   angle => a.b = |a|*|b|* cos x

    block=12;

    p=1:size(direction_vectors,1);

   z=0; 
  for y= 0:(block/2):length(direction_vectors)-12
      for k =(1+y):(block+y-1)
          for j =1:block-(k-y)
            dot_product1 = dot(direction_vectors(:,k), direction_vectors(:,k+j));
            magnitude1 = norm(direction_vectors(:,k)) * norm(direction_vectors(:,k+j));
            an1(k-y,j+k-y)=real(acos(dot_product1/magnitude1))* 180 / pi;           
          end
      end
      z=z+1;     
      angle_vector1{z}=num2cell(an1);
  end    
  for a=1:length(angle_vector1)
    %figure
    %title('Testing');
    x = cell2mat(angle_vector1{1,a});
    %plot(x(1,:)); pause   
    %plot(1:length(angle_vector1),angle_vector1);        
  end
    figure
  s=0;
  for a=1:length(angle_vector1)
    x = cell2mat(angle_vector1{1,a});
    newA=[];
    for f=2:size(x,2)
        newA =[newA weight_average(x(:,f),f-1)] ;  
    end
   s=s+1;     
   tess(s,:)=(newA);  
   t= 1+(s-1)*6: length(newA)+(s-1)*6;
   if mod(s,2)==0
    plot(t,newA,'g'); 
   else
    plot(t,newA,'r'); 
   end
   hold on
  end
 
  last = tess(:,11)';
  plot(11:6:length(tess(:,11))*6+10,tess(:,11),'b');
  
  
    for x=1:length(direction_vectors)-1
        dot_product = dot(direction_vectors(:,x), direction_vectors(:,x+1));
        magnitude = norm(direction_vectors(:,x)) * norm(direction_vectors(:,x+1));
        angle_vector(x)=real(acos(dot_product/magnitude))* 180 / pi;
    end
    %figure
    %title('Angles');
    %plot(1:length(angle_vector),angle_vector);
    
    
    [a,v]=overlap_average(angle_vector,100,50);
    %figure
    %title('Angles Average');
    %plot(1:length(a),a);
    %figure
    %title('Variance of averaging');
    %plot(1:length(v),v);
end

