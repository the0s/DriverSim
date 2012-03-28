function [ indexa ] = lap_structure( filename, vectors_merge_no,angles_block_no )
%LAP_STUCTURE Creates a structure of the Track entered
%  filename -> single track data for extrapolating results
%   merge_no -> number of points to merge (EVEN)
%   block -> number of direction_vectors to merge-overlap

[~,~, ~, ~,~,~,~,~,~, position3d, ~,~, ~,~,~,~] = RacerToMatlab(filename);
[direction_vectors pos] = vectors(position3d, vectors_merge_no);
[angles_last ,~,~,~] = angles(direction_vectors,angles_block_no);

[indexa]= anglesOntrack(angles_last, direction_vectors, position3d, pos, vectors_merge_no, angles_block_no);



end

