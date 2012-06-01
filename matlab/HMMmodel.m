load('structureWithUsers.mat')

user = all_struct.theo;
p=1;
tparam=[];
for x=1:size(user,2)
    angle= user{1,x};
    for y=1:size(user{2,x},2)
        inputs= user{2,x}{1,y};
        tparam(p,:)=raw2modelCepstrum(inputs', angle);
        p=p+1;
    end
end

user = all_struct.violaris;
p=1;
vparam=[];
for x=1:size(user,2)
    angle= user{1,x};
    for y=1:size(user{2,x},2)
        inputs= user{2,x}{1,y};
        vparam(p,:)=raw2modelCepstrum(inputs', angle);
        p=p+1;
    end
end

user = all_struct.kotsios;
p=1;
kparam=[];
for x=1:size(user,2)
    angle= user{1,x};
    for y=1:size(user{2,x},2)
        inputs= user{2,x}{1,y};
        kparam(p,:)=raw2modelCepstrum(inputs', angle);
        p=p+1;
    end
end
    