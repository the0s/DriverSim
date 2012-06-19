function [ index ] = create_training_data(filename, distanceoftrack)
%CREATE_TRAINING_DATA Convert Racer text file to multiple files according to track data
%Author: Theos
%Date: 11/03/2012
%filename -> text file to cut
%distanceoftrack -> distance of the track to do the decimation
    [A,~, ~, ~,~,~,~,lapdistance,~, ~, ~,~, ~,~,~,~] = RacerToMatlab(filename);
    
    index = track_decimation(lapdistance,distanceoftrack);
    files_no= size(index,2)-1;
    
    for x=1:files_no
        file_name= strcat(filename(1:size(filename,2)-4),  num2str(x), '.txt');
        fileID = fopen(file_name,'w');
        A(:,index(x):index(x+1)); % goes from first index to the next, therefore first lap is ignored
        fprintf(fileID,'%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g\r\n',A(:,index(x):index(x+1)));
        fclose(fileID);
    end
    
end

