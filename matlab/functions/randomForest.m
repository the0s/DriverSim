function [ output_args ] = randomForest( angle_var, type, instance, numberoftrees )
%RANDOMFOREST Enter angle to get training data and instance to get
%prediction using random forest
%   Detailed explanation goes here

%# load data
%clear all

%parma=load('angle402020.csv');
name = strcat('angle', num2str(angle_var(1,1)),num2str(angle_var(1,2)),num2str(angle_var(1,3)),type, '.csv');
try
parma=load(name);
catch err
    display(err.message);
    prediction = [];
return ;
end

classNO= [ 0; 1; 2; 3; 4; 5;6;7];
className = {'viol'; 'theo'; 'kots'; 'haro';'aadi'; 'yian'; 'loiz'; 'xris'};
   
for d=1:size(parma,1)
    for p=1:size(classNO,1)
        if parma(d,size(parma,2)) == classNO(p,1)
            y(d,1) = className(p); 
        end
    end
end
%# construct predicting attributes and target class

x= parma(:,1:size(parma,2)-1);
y = strcat(y,{});

%# train classification decision forest tree
TreeObject=TreeBagger(numberoftrees,x,y,'method','classification','NVarToSample','all');


%# test
FyPredicted = predict(TreeObject, x);
Fcm = confusionmat(y,FyPredicted);           %# confusion matrix
N = sum(cm(:));
err = ( N-sum(diag(cm)) ) / N;             %# testing error

%# predict a new unseen instance
[prediction,scores] = predict(TreeObject,instance)



end
