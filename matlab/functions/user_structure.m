function [ indexa ] = user_structure(  filename, vectors_merge_no,angles_block_no, plotting, instance )
%USER_STRUCTURE Creates a structure of the Track entered
%  filename -> single track data for extrapolating results
%   merge_no -> number of points to merge (EVEN)
%   block -> number of direction_vectors to merge-overlap

    if ~exist('instance', 'var')
        instance = 'n';
    end
    
[A,check, speed, brakes,gas,clutch,gear,lapdistance,time, position3d, acceleration3d,steering, gForceLat,gForceLong,handbrake,lapTime] = RacerToMatlab(filename, instance);
[direction_vectors pos] = vectors(position3d, vectors_merge_no,plotting);
[angles_last ,angle_vector_consequtive,angle_cell,angle_sequences] = angles(direction_vectors,angles_block_no, plotting);

[indexa]= anglesOntrack(angles_last,direction_vectors,position3d, pos,vectors_merge_no,angles_block_no, plotting);


block_vect=floor(angles_block_no/2);
block_pos = floor(vectors_merge_no/2) * block_vect;

z=1;
usr_input = [gas; brakes; steering; gear;speed; time;];
for x=block_pos:block_pos:length(position3d)-block_pos %SASTOOO
usr_inp{1,z} = usr_input(:,x-(block_pos-1):x+block_pos);
check_temp{1,z} = check(1,x-(block_pos-1):x+block_pos);
          z=z+1;
end

for g=1:z-1
 usr_inp{2,g} = max(check_temp{1,g}(1,:));
end

indexa.user_input = usr_inp;

end

