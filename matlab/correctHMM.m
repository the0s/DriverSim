function [answer,who] = correctHMM(array,w)
%correct returns correct or wrong to the answer of HMM
%w index that should be correct
[~,i] = max(array);
if i == w
    display('correct :)')
    answer =1;
    who = i;
else
    display('wrong :(')
    answer=0;
    who = i;
end