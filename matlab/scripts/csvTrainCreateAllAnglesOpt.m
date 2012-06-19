function [ param,er ] = csvTrainCreateAllAnglesOpt (type)
%csvTraincreate Creates the csv files for classification of all angles
%determined by 3 types
% good-> feature vectors that user was in the lap
% bad -> feature vectors that user was out of the lap
%ugly-> combined set of bad and good

%USED after testUSERWithLAp in order to use all_struct and all_Struct_bad



%NOT FIXED
%load('old_track_new_data.mat');
%load('old_track_old_data');
%load('old_track_all');  
%load('new_track');
%load('old_track_all_2018');
%load('new_track2018');

load('please');
class={'violaris' 0;
       'theo' 1;
       'kotsios' 2;
       'harold' 3;
       'aadil' 4;
       'yiannis' 5;
       'loizos' 6;
       'xristos' 7};
   
 
 %angles = {[1,1,0], [1,0,1],[0,1,1],[1,1,1],[1,1,6],[1,6,6],[6,6,21],[6,21,21],[21,21,35],[21,35,35],[35,35,35],[35,35,30],[35,30,30],[30,30,32],[30,32,32],[32,32,14],[32,14,14],[14,14,14],[14,14,7],[14,7,7],[7,7,7],[7,7,18],[7,18,18],[18,18,32],[18,32,32],[32,32,32],[14,14,46],[14,46,46],[46,46,40],[46,40,40],[40,40,20],[24,9,9],[9,9,1],[9,1,1],[1,1,2],[1,2,2],[2,2,2],[2,2,6],[2,6,6],[6,6,31],[6,31,31],[31,31,59],[31,59,59],[59,59,33],[59,33,33],[33,33,2],[33,2,2],[2,2,8],[2,8,8],[8,8,28],[8,28,28],[28,28,14],[28,14,14],[14,14,31],[14,31,31],[31,31,6],[31,6,6],[6,6,6],[6,6,4],[6,4,4],[4,4,5],[4,5,5],[5,5,18],[5,18,18],[18,18,34],[18,34,34],[34,34,34],[34,34,3],[34,3,3],[3,3,1],[3,1,2],[2,2,13],[9,2,2],[2,2,4],[2,4,4],[4,4,19],[4,19,19],[19,19,19],[19,19,10],[19,10,15],[10,15,15],[15,15,25],[15,25,25],[25,25,21],[25,21,21],[21,21,18],[21,18,23],[18,23,23],[23,23,27],[23,27,27],[27,27,9],[27,9,9],[9,9,5],[9,5,6],[5,6,6],[6,6,5],[6,5,4],[5,4,4],[4,4,2],[4,2,1],[2,1,1],[1,0,0],[0,0,0],[0,0,1],[21,21,21],[1,1,12],[9,1,2],[6,4,5],[2,13,13],[19,10,10],[10,10,15],[15,25,21],[21,18,18],[18,18,23],[18,23,27],[6,5,5],[5,5,4],[4,2,2],[2,2,1],[40,40,40],[40,20,20],[20,20,1],[20,1,1],[1,12,12],[12,12,24],[12,24,9],[24,9,1],[33,33,33],[4,5,18],[10,15,25],[9,5,5],[5,5,6],[5,4,2],[46,46,46],[12,24,24],[24,24,9],[8,8,8],[3,3,3],[3,1,1],[9,9,2],[2,4,19],[25,21,18],[20,20,20],[1,12,24],[2,6,31],[59,59,59],[2,13,28],[13,28,28],[28,28,9],[28,9,2],[9,9,9],[5,5,5],[2,8,28],[13,13,28],[30,30,30],[18,18,18],[28,28,28],[31,31,31],[13,28,9],[28,9,9],[15,15,15],[5,6,5],[7,18,32],[31,59,33],[4,4,4],[14,31,6],[6,21,35],[8,28,14],[5,18,34],[34,3,1],[28,14,31],[23,27,9],[1,6,21],[27,27,27],[27,9,5],[13,13,13],[12,12,12];};
 %good
  angles = {[1,1,6],[1,1,1],[1,1,0],[1,0,0],[0,0,0],[0,0,4],[0,4,4],[4,4,20],[4,20,20],[20,20,29],[20,29,29],[29,29,31],[29,31,27],[31,27,27],[27,27,31],[27,31,31],[31,31,19],[31,19,19],[19,19,4],[24,24,23],[24,23,23],[23,23,13],[23,13,13],[13,13,21],[13,21,21],[21,21,20],[21,20,20],[20,20,13],[20,13,13],[13,13,9],[13,9,5],[9,5,5],[5,5,3],[5,3,3],[3,3,3],[3,3,1],[3,1,0],[1,0,1],[0,1,1],[1,1,2],[1,2,2],[2,2,2],[2,2,5],[2,5,5],[5,5,14],[5,14,14],[14,14,21],[14,21,21],[21,21,14],[21,14,14],[10,5,5],[5,5,2],[5,2,2],[2,2,8],[2,8,6],[8,6,6],[6,6,3],[6,3,3],[3,3,5],[3,5,6],[5,6,6],[6,6,7],[6,7,13],[7,13,13],[4,4,1],[4,1,1],[0,0,1],[1,1,4],[16,16,16],[2,2,1],[2,1,2],[2,2,3],[2,3,3],[3,3,4],[3,4,4],[4,4,4],[4,4,3],[4,3,3],[3,4,2],[4,2,2],[2,2,6],[2,6,8],[6,8,8],[8,8,11],[9,6,2],[6,2,2],[2,2,4],[2,4,5],[4,5,5],[5,5,5],[5,5,7],[5,7,13],[13,13,17],[13,17,13],[17,13,13],[13,9,9],[9,9,9],[9,9,8],[9,8,4],[8,4,4],[4,1,0],[0,4,20],[20,29,31],[29,31,31],[31,31,27],[12,15,15],[15,15,24],[15,24,24],[13,21,20],[20,13,9],[9,9,5],[5,14,21],[14,14,3],[14,3,10],[3,10,10],[10,10,5],[5,2,8],[2,8,8],[8,8,6],[8,6,3],[20,20,11],[20,11,4],[11,4,4],[8,8,14],[8,14,14],[14,14,23],[14,23,23],[23,23,26],[23,26,26],[4,3,2],[3,2,2],[2,3,4],[4,2,6],[2,6,6],[6,6,8],[6,8,11],[8,11,16],[11,16,16],[16,16,14],[16,14,10],[14,10,10],[10,10,9],[10,9,6],[9,6,6],[6,6,2],[6,2,4],[2,4,4],[4,4,5],[4,20,29],[4,4,12],[4,12,15],[23,13,21],[14,21,14],[14,3,3],[3,3,10],[10,5,2],[20,11,11],[11,11,4],[1,4,4],[4,4,11],[4,3,4],[4,4,2],[11,16,14],[5,7,7],[7,7,13],[7,13,17],[19,4,4],[4,12,12],[12,12,15],[15,24,23],[3,1,1],[2,5,14],[6,6,6],[6,7,7],[7,13,21],[1,4,11],[4,11,11],[11,11,31],[11,31,24],[31,24,24],[24,24,8],[24,8,8],[8,8,8],[16,14,14],[14,14,10],[14,10,9],[19,4,12],[12,15,24],[21,20,13],[9,5,3],[21,14,3],[5,6,7],[3,3,2],[3,2,1],[2,1,1],[1,2,3],[31,19,4],[3,10,5],[31,27,31],[21,21,21],[14,14,14],[10,10,10],[8,14,23],[26,26,16],[26,16,16],[16,16,3],[16,3,3],[3,4,3],[13,17,17],[17,17,13],[17,13,9],[9,8,8],[8,8,4],[31,31,31],[6,3,5],[8,11,11],[11,11,16],[10,9,9],[9,9,6],[21,20,11],[24,23,13],[3,5,5],[5,5,6],[14,23,26],[27,31,19],[23,23,23],[24,8,14],[4,11,31],[11,31,31],[31,31,24],[26,26,26],[16,3,4],[11,11,11],[27,27,27],[3,10,3],[10,3,14],[3,14,21],[12,12,12],[15,15,15],[23,26,16],[19,19,19],[20,20,20],[31,24,8];};
   
 %angles= {[32,14,14], [13,28,28]};
 for aX=1:size(angles,2)
      p=1;   
      param=[];
      er=[];
      if (strcmp(type,'good')) || (strcmp(type,'ugly'))
          Model_Group = all_struct.violaris;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 0, p );
          Model_Group = all_struct.theo;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 1, p ); 
          Model_Group = all_struct.kotsios;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 2, p );
          %      Model_Group = all_struct.harold;
          %[ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 3, p );
          %      Model_Group = all_struct.aadil;
          %[ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 4, p );
          %      Model_Group = all_struct.yiannis;
          %[ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 5, p );
                Model_Group = all_struct.loizos;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 6, p );
                Model_Group = all_struct.xristos;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 7, p );
      display('good');
      end
      if (strcmp(type,'bad')) || (strcmp(type,'ugly'))
          Model_Group = all_struct_bad.violaris;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 0, p );
          Model_Group = all_struct_bad.theo;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 1, p ); 
          Model_Group = all_struct_bad.kotsios;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 2, p );
         %       Model_Group = all_struct_bad.harold;
         % [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 3, p );
         %       Model_Group = all_struct_bad.aadil;
         % [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 4, p );
         %       Model_Group = all_struct_bad.yiannis;
         % [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 5, p );
                Model_Group = all_struct_bad.loizos;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 6, p );
                Model_Group = all_struct_bad.xristos;
          [ er, param, p ] = angleModelFeaturesCreator( er, param, Model_Group, angles{1,aX}, 7, p );
       display('bad');
      end
      %Normalise otherwise!!!:p find max of all and use it always by that
      %in all values
    %for t=1:size(param,2)-1
    %    temp = max(abs(param(:,t)));
    %    if temp ~=0
    %        param(:,t)= param(:,t)/temp;
    %    end
    %end

    
    name = strcat('angle', num2str(angles{1,aX}(1,1)),num2str(angles{1,aX}(1,2)),num2str(angles{1,aX}(1,3)),type, '.csv');
    if isempty(param)==0
        cell2csv(name, num2cell(param));
    end
    end
end
    