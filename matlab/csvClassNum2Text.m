function [ data, class ] = csvClassNum2Text( csvfile,columns )
%CSCLASSNUM2TEXT gets a csv file with parameters and returns the data with
%their textual classes
%   columns= selects only the columns that are necessary FOUNd FROM SFS
if ~exist('columns', 'var')
    columns = 0 ;
end


try
parma=load(csvfile);
catch err
display(err.message);    
parma=[];
end

if (isempty(parma) == 0 && size(parma,1) >10) %remove those that have low value of training or test data
    
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
    %className = {'viol'; 'theo'; 'theo'; 'theo';'theo';'theo';'theo'; 'theo'};

    for d=1:size(parma,1)
        for p=1:size(classNO,1)
            if parma(d,size(parma,2)) == classNO(p,1)
                y(d,1) = className(p); 
            end
        end
    end

    if columns == 0
        data= parma(1:size(parma,1),1:size(parma,2)-1);
    else
        data= parma(1:size(parma,1),columns);
    end
    y = strcat(y,{});

    class=y(1:size(y,1));
else
    display('empty_file')
    data = [];
    class = cell(0);
end

end

