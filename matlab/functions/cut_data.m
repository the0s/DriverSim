function [datacell] = cut_data( filename, len )
%CUT_DATA Creates a cell of data of length according to the length parameter
% filename-> file name to cut
% len-> length of the samples in seconds
    %%load the file matrix   
    A = loadRacerFile(filename);
    %%convert to seconds
    time = A(8,:)/1000; 
    %%get average sampling time
    dt = (time(11)-time(1))/10;
    %%round the amound  of samples to collect
    samples = round(len/dt);
    
    p=1;
    k=1;
    for x=1:samples:size(A,2)-samples;
        flag=0;
        temp = A(:,x : x+samples);
        datacell{1,p}= temp;
        datacell{4,p}= [ max(temp(9,:)) min(temp(9,:));  max(temp(10,:)) min(temp(10,:)); max(temp(11,:)) min(temp(11,:))];
        for z=1:samples
            if temp(1,z) == 1
                flag = 1;
            end
        end
        if flag == 0
            datacell{2,p} = 0;
            datacell{3,k}= temp;
            k=k+1;
        else 
            datacell{2,p} = 1;
        end
        p=p+1;
    end
        
end

