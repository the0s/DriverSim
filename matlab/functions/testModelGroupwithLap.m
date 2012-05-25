function [ output_args ] = testModelGroupwithLap( Lap_Indexa, Model_Indexa, group_no )
%TESTMODELGROUPWITHLAP Summary of this function goes here
%   Detailed explanation goes here
figure;
for x=1:size(Lap_Indexa.pos,2)
plot(Lap_Indexa.pos{1,x}(1,:), Lap_Indexa.pos{1,x}(3,:));
hold on
end

for x=1:size(Model_Indexa{3,group_no},2)
plot(Model_Indexa{3,group_no}{1,x}(1,:), Model_Indexa{3,group_no}{1,x}(3,:),'r');
hold on
end

end

