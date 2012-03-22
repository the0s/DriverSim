mn=[];
vr=[];
for t = 1:5:size(A,2)-10
     matrix = A(:,t:t+10);
     m = mean(matrix,2);
     mn= [mn m];
     v = var(matrix');
     vr = [vr v'];
end