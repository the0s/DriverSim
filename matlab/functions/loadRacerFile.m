function [ matrix ] = loadRacerFile( filename )
%LOADRACERFILE Loads the particular file creater from Racer
%   filename-> name of the file (txt)

    fid = fopen(filename);
    matrix = fscanf(fid,'%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g',[19, inf] );
    fclose(fid);
end

