%# load data
clear all
%load carsmall
%load('paramAngle.mat')
%load('paramAngle2.mat');
parma=load('angle111goodPCA6.csv');
%load('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\matlab_file\paramAngle.mat')
class={'violaris' 0;
       'theo' 1;
       'kotsios' 2;
       'harold' 3;
       'aadil' 4;
       'yiannis' 5;
       'loizos' 6;
       'xristos' 7};
   
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
vars = {'MPG' 'Cylinders' 'Horsepower' 'Model_Year'};
%x = [MPG Cylinders Horsepower Model_Year];
%x= parma(2:size(parma,1),1:70);
x= parma(1:size(parma,1),1:size(parma,2)-1);
%y = strcat(Origin,{});
y = strcat(y,{});

y=y(1:size(y,1));
%# train classification decision tree
t = classregtree(x, y, 'method','classification',  ...
                 'prune','on');
             %'categorical', [2 4],
%view(t)

%# test
yPredicted = eval(t, x);
cm = confusionmat(y,yPredicted);           %# confusion matrix
N = sum(cm(:));
err = ( N-sum(diag(cm)) ) / N;             %# testing error

%# prune tree to avoid overfitting
tt = prune(t, 'level',2);
view(tt)

%# predict a new unseen instance
%inst = [0.839499750000001,0,0.279041537037037,0.800000000000000,0.841360000000000,0,0.395000000000000,0.800000000000000,0.834982000000000,0,0.106000000000000,0.800000000000000,2.84581551538457e-05,0,0.336830758690686,0,0,0.534423194432635,0,0,0,0,0,0.00339569421789122,0,0,0,0,0.804848174441629,0.821614173494269,0.799807537183533,0.101013690836473,-0.380123198165395,0,-0.984226292159491,0,-0.000878469194571176,0,-0.208116058795179,0,0.647780583902023,0.765481835077615,0.265100549156141,0,0.723962009924144,0.640000000000000,0.279041537037038,0,0.839499750000001,0.0778641793919921,0,0.235093806177831,0,0,0.704759830250062,0.410819313929810,0.584775090020126,0.0789831234456657,0,0.521920073054220,0.409600000000000,0.0935929395781714,0,0.704638810131151,0.00887746754675712,0,0.0660436204104794,0,0,0.496515896493710;];
inst= parma(1:2,1:size(parma,2)-1);
prediction = eval(tt, inst)


TreeObject=TreeBagger(100,x,y,'method','classification','NVarToSample','all');
fyPredicted = predict(TreeObject, x);
fcm = confusionmat(y,fyPredicted);           %# confusion matrix
[YFIT,scores] = predict(TreeObject,inst)