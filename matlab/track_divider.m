function [ angles ] = track_divider(direction_vectors)
%TRACK_DIVIDER Find the angle between 2 cosecutive vectors
%   angle => a.b = |a|*|b|* cos x

    p=1:size(direction_vectors,1);


    for x=1:length(direction_vectors)-1
        dot_product = dot(direction_vectors(:,x), direction_vectors(:,x+1));
        magnitude = norm(direction_vectors(:,x)) * norm(direction_vectors(:,x+1));

        angles(x)=real(acos(dot_product/magnitude))* 180 / pi;
    end
    figure
    title('Angles');
    plot(1:length(angles),angles);
    
    
    [a,v]=overlap_average(angles,100,50);
    figure
    title('Angles Average');
    plot(1:length(a),a);
    figure
    title('Variance of averaging');
    plot(1:length(v),v);
end

