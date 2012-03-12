function [ index ] = create_training_data(filename)
%CREATE_TRAINING_DATA Convert Racer text file to multiple files according to track data
%Author: Theos
%Date: 11/03/2012

    fid = fopen(filename);
    A = fscanf(fid,'%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g',[19, inf] );
    fclose(fid);
    
    lapdistance = A(7,:);
    index = track_decimation(lapdistance);
    files_no= size(index,2)-1;
    
    for x=1:files_no
        file_name= strcat(filename(1:size(filename,2)-4),  num2str(x), '.txt');
        fileID = fopen(file_name,'w');
        A(:,index(x):index(x+1));
        fprintf(fileID,'%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g\r\n',A(:,index(x):index(x+1)));
        fclose(fileID);
    end
    
end

