parma=load('laps.csv');

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

X= parma(1:size(parma,1),1:size(parma,2)-1);
y = strcat(y,{});
y=y(1:size(y,1));


c = cvpartition(y,'k',10);
opts = statset('display','iter');
fun = @(XT,yT,Xt,yt)...
      (sum(~strcmp(yt,predict(TreeBagger(2,XT,yT,'method','classification','NVarToSample','all'), Xt))));

[fs,history] = sequentialfs(fun,X,y,'cv',c,'options',opts);
