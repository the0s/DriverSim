function [ crash_prob ] = CrashProb( good, bad, angle_vect )
%CRASHPROB Takes the previous laps (good + bad) and gives a probability on
%what will happen
%   !!!!!!!!CHeck on speed as well!!!
gsize= 0.001;
for x=1:size(good,2)
    if angle_vect== good{1,x}
        gsize = size(good{2,x},2);
    end
end

bsize= 0.001;
for x=1:size(bad,2)
    if angle_vect== bad{1,x}
        bsize = size(bad{2,x},2);
    end
end

crash_prob = (bsize/ (gsize + bsize))*100 




end

