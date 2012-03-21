load sampleData;
load('tracks.mat')
paramsData.weightsPerSequence = ones(1,128) ;
paramsData.factorSeqWeights = 1;

paramsNodHCRF.normalizeWeights = 1;
T{1}.params = paramsNodHCRF;
[T{1}.model T{1}.stats] = train(trainingSeq, trainingLab, T{1}.params);
[T{1}.ll T{1}.Newlabels] = test(T{1}.model, testingSeq, testingLab);