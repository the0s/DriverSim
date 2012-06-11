function [answer] = correctHMM(array,w)
%correct returns correct or wrong to the answer of HMM
%w index that should be correct
[~,i] = max(array);
if i == w
    display('correct :)')
else
    display('wrong :(')
end