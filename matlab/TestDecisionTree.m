%# load data
clear all
%load carsmall
%load('paramAngle.mat')
%load('paramAngle2.mat');
%load('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\matlab_file\paramAngle.mat')

columns = 0;
%columns= [1:12,66:70];
%columns =[5,6,7,11,16,29,31,42,44,48,49,56,57,59,62,68,69,79,89];
%columns = [1 ,2,3,4,5,8,11,12,15,17,30,32,49,56,58,60,68,69,75,76,87,90,91];%[1:22];
%angles = {[1,1,0], [1,0,1],[0,1,1],[1,1,1],[1,1,6],[1,6,6],[6,6,21],[6,21,21],[21,21,35],[21,35,35],[35,35,35],[35,35,30],[35,30,30],[30,30,32],[30,32,32],[32,32,14],[32,14,14],[14,14,14],[14,14,7],[14,7,7],[7,7,7],[7,7,18],[7,18,18],[18,18,32],[18,32,32],[32,32,32],[14,14,46],[14,46,46],[46,46,40],[46,40,40],[40,40,20],[24,9,9],[9,9,1],[9,1,1],[1,1,2],[1,2,2],[2,2,2],[2,2,6],[2,6,6],[6,6,31],[6,31,31],[31,31,59],[31,59,59],[59,59,33],[59,33,33],[33,33,2],[33,2,2],[2,2,8],[2,8,8],[8,8,28],[8,28,28],[28,28,14],[28,14,14],[14,14,31],[14,31,31],[31,31,6],[31,6,6],[6,6,6],[6,6,4],[6,4,4],[4,4,5],[4,5,5],[5,5,18],[5,18,18],[18,18,34],[18,34,34],[34,34,34],[34,34,3],[34,3,3],[3,3,1],[3,1,2],[2,2,13],[9,2,2],[2,2,4],[2,4,4],[4,4,19],[4,19,19],[19,19,19],[19,19,10],[19,10,15],[10,15,15],[15,15,25],[15,25,25],[25,25,21],[25,21,21],[21,21,18],[21,18,23],[18,23,23],[23,23,27],[23,27,27],[27,27,9],[27,9,9],[9,9,5],[9,5,6],[5,6,6],[6,6,5],[6,5,4],[5,4,4],[4,4,2],[4,2,1],[2,1,1],[1,0,0],[0,0,0],[0,0,1],[21,21,21],[1,1,12],[9,1,2],[6,4,5],[2,13,13],[19,10,10],[10,10,15],[15,25,21],[21,18,18],[18,18,23],[18,23,27],[6,5,5],[5,5,4],[4,2,2],[2,2,1],[40,40,40],[40,20,20],[20,20,1],[20,1,1],[1,12,12],[12,12,24],[12,24,9],[24,9,1],[33,33,33],[4,5,18],[10,15,25],[9,5,5],[5,5,6],[5,4,2],[46,46,46],[12,24,24],[24,24,9],[8,8,8],[3,3,3],[3,1,1],[9,9,2],[2,4,19],[25,21,18],[20,20,20],[1,12,24],[2,6,31],[59,59,59],[2,13,28],[13,28,28],[28,28,9],[28,9,2],[9,9,9],[5,5,5],[2,8,28],[13,13,28],[30,30,30],[18,18,18],[28,28,28],[31,31,31],[13,28,9],[28,9,9],[15,15,15],[5,6,5],[7,18,32],[31,59,33],[4,4,4],[14,31,6],[6,21,35],[8,28,14],[5,18,34],[34,3,1],[28,14,31],[23,27,9],[1,6,21],[27,27,27],[27,9,5],[13,13,13],[12,12,12];};
%good
angles = {[1,1,1],[1,1,0],[1,0,0],[0,0,0],[0,0,4],[0,4,4],[4,4,20],[4,20,20],[20,20,29],[20,29,29],[29,29,31],[29,31,27],[31,27,27],[27,27,31],[27,31,31],[31,31,19],[31,19,19],[19,19,4],[24,24,23],[24,23,23],[23,23,13],[23,13,13],[13,13,21],[13,21,21],[21,21,20],[21,20,20],[20,20,13],[20,13,13],[13,13,9],[13,9,5],[9,5,5],[5,5,3],[5,3,3],[3,3,3],[3,3,1],[3,1,0],[1,0,1],[0,1,1],[1,1,2],[1,2,2],[2,2,2],[2,2,5],[2,5,5],[5,5,14],[5,14,14],[14,14,21],[14,21,21],[21,21,14],[21,14,14],[10,5,5],[5,5,2],[5,2,2],[2,2,8],[2,8,6],[8,6,6],[6,6,3],[6,3,3],[3,3,5],[3,5,6],[5,6,6],[6,6,7],[6,7,13],[7,13,13],[4,4,1],[4,1,1],[0,0,1],[1,1,4],[16,16,16],[2,2,1],[2,1,2],[2,2,3],[2,3,3],[3,3,4],[3,4,4],[4,4,4],[4,4,3],[4,3,3],[3,4,2],[4,2,2],[2,2,6],[2,6,8],[6,8,8],[8,8,11],[9,6,2],[6,2,2],[2,2,4],[2,4,5],[4,5,5],[5,5,5],[5,5,7],[5,7,13],[13,13,17],[13,17,13],[17,13,13],[13,9,9],[9,9,9],[9,9,8],[9,8,4],[8,4,4],[4,1,0],[0,4,20],[20,29,31],[29,31,31],[31,31,27],[12,15,15],[15,15,24],[15,24,24],[13,21,20],[20,13,9],[9,9,5],[5,14,21],[14,14,3],[14,3,10],[3,10,10],[10,10,5],[5,2,8],[2,8,8],[8,8,6],[8,6,3],[20,20,11],[20,11,4],[11,4,4],[8,8,14],[8,14,14],[14,14,23],[14,23,23],[23,23,26],[23,26,26],[4,3,2],[3,2,2],[2,3,4],[4,2,6],[2,6,6],[6,6,8],[6,8,11],[8,11,16],[11,16,16],[16,16,14],[16,14,10],[14,10,10],[10,10,9],[10,9,6],[9,6,6],[6,6,2],[6,2,4],[2,4,4],[4,4,5],[4,20,29],[4,4,12],[4,12,15],[23,13,21],[14,21,14],[14,3,3],[3,3,10],[10,5,2],[20,11,11],[11,11,4],[1,4,4],[4,4,11],[4,3,4],[4,4,2],[11,16,14],[5,7,7],[7,7,13],[7,13,17],[19,4,4],[4,12,12],[12,12,15],[15,24,23],[3,1,1],[2,5,14],[6,6,6],[6,7,7],[7,13,21],[1,4,11],[4,11,11],[11,11,31],[11,31,24],[31,24,24],[24,24,8],[24,8,8],[8,8,8],[16,14,14],[14,14,10],[14,10,9],[19,4,12],[12,15,24],[21,20,13],[9,5,3],[21,14,3],[5,6,7],[3,3,2],[3,2,1],[2,1,1],[1,2,3],[31,19,4],[3,10,5],[31,27,31],[21,21,21],[14,14,14],[10,10,10],[8,14,23],[26,26,16],[26,16,16],[16,16,3],[16,3,3],[3,4,3],[13,17,17],[17,17,13],[17,13,9],[9,8,8],[8,8,4],[31,31,31],[6,3,5],[8,11,11],[11,11,16],[10,9,9],[9,9,6],[21,20,11],[24,23,13],[3,5,5],[5,5,6],[14,23,26],[27,31,19],[23,23,23],[24,8,14],[4,11,31],[11,31,31],[31,31,24],[26,26,26],[16,3,4],[11,11,11],[27,27,27],[3,10,3],[10,3,14],[3,14,21],[12,12,12],[15,15,15],[23,26,16],[19,19,19],[20,20,20],[31,24,8];};

q=0;

for aX= 1:size(angles,2)
%trainname = strcat('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\csv\angle-vectors\old_track_all\ugly\','angle', num2str(angles{1,aX}(1,1)),num2str(angles{1,aX}(1,2)),num2str(angles{1,aX}(1,3)),'ugly', '.csv')
%testname = strcat('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\csv\angle-vectors\new_track\ugly\', 'angle', num2str(angles{1,aX}(1,1)),num2str(angles{1,aX}(1,2)),num2str(angles{1,aX}(1,3)),'ugly', '.csv')
trainname = strcat('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\HMM\','angle', num2str(angles{1,aX}(1,1)),num2str(angles{1,aX}(1,2)),num2str(angles{1,aX}(1,3)),'ugly', '.csv')
testname = strcat('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\HMM\','angle', num2str(angles{1,aX}(1,1)),num2str(angles{1,aX}(1,2)),num2str(angles{1,aX}(1,3)),'ugly', '.csv')
%testname=
[x,y] = csvClassNum2Text(trainname,columns);
[inst,h] = csvClassNum2Text(testname,columns);

%[x,y] = csvClassNum2Text('laps_a.csv',columns);
%[x,y] = csvClassNum2Text('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\csv\angle-vectors\old_data_and_track\good\angle121212good.csv',columns);

%# train classification decision tree
if (isempty(x) == 0) && (isempty(inst) == 0)
    q= q+1;
    
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
    %view(tt)

    %# predict a new unseen instance
    %inst = [0.839499750000001,0,0.279041537037037,0.800000000000000,0.841360000000000,0,0.395000000000000,0.800000000000000,0.834982000000000,0,0.106000000000000,0.800000000000000,2.84581551538457e-05,0,0.336830758690686,0,0,0.534423194432635,0,0,0,0,0,0.00339569421789122,0,0,0,0,0.804848174441629,0.821614173494269,0.799807537183533,0.101013690836473,-0.380123198165395,0,-0.984226292159491,0,-0.000878469194571176,0,-0.208116058795179,0,0.647780583902023,0.765481835077615,0.265100549156141,0,0.723962009924144,0.640000000000000,0.279041537037038,0,0.839499750000001,0.0778641793919921,0,0.235093806177831,0,0,0.704759830250062,0.410819313929810,0.584775090020126,0.0789831234456657,0,0.521920073054220,0.409600000000000,0.0935929395781714,0,0.704638810131151,0.00887746754675712,0,0.0660436204104794,0,0,0.496515896493710;];


    %inst= parma(1:2,1:size(parma,2)-1);
    %[inst,h] = csvClassNum2Text('laps2_a.csv',columns);
    
   
    
    %[inst,h] = csvClassNum2Text('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\csv\angle-vectors\all_track_new_data\good\angle121212good.csv',columns);

        prediction = eval(tt, inst);
        cm_test = confusionmat(h,prediction);           %# confusion matrix
        N = sum(cm_test(:));
        err_test = ( N-sum(diag(cm_test)) ) / N;             %# testing error
        Success_DT(1,q) =(sum(diag(cm_test)) /N) * 100;

        TreeObject=TreeBagger(30,x,y,'method','classification','NVarToSample','all','oobpred','on');

        %plot(oobError(TreeObject))
        %      xlabel('number of grown trees')
        %      ylabel('out-of-bag classification error')
        fyPredicted = predict(TreeObject, x);
        fcm = confusionmat(y,fyPredicted);           %# confusion matrix
        [YFIT,scores] = predict(TreeObject,inst);
        fcm_test = confusionmat(h,YFIT);           %# confusion matrix
        N = sum(fcm_test(:));
        errf_Test = ( N-sum(diag(fcm_test)) ) / N;             %# testing error
        Success_RF(1,q) = (sum(diag(fcm_test)) /N) * 100;
        
        angle_table{1,q} = angles{1,aX};
        angle_table{2,q} = Success_RF(1,q);
        angle_table{3,q} = Success_DT(1,q);
   
end   
end