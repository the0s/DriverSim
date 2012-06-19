function [ data ] = transformHMMmatrix( User_Model_Sequences, coefficients)
%transformHMMmatrix Input a model structure of sequences and transform it
%to HMM related type for data
data=[];

if isempty(coefficients) == 1
  

%c loops over sequences
%a loops over coefficients
%b loops in sequence
for c=1:size(User_Model_Sequences,1)
    for a=1:size(User_Model_Sequences{c,1}{1,1},2)
        for b=1:size(User_Model_Sequences{c,1},2)  
 data(a,b,c) = User_Model_Sequences{c,1}{1,b}(:,a);
        end
    end
end

else
p=0;
for a = coefficients
    p=p+1;
    for c=1:size(User_Model_Sequences,1)
        for b=1:size(User_Model_Sequences{c,1},2)  
 data(p,b,c) = User_Model_Sequences{c,1}{1,b}(:,a);
        end
    end
end

end

end