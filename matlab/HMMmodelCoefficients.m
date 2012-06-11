%%
%data
%load('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\matlab_file\HMM108.mat')
%load('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\matlab_file\HMMnewAllmore.mat')
load('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\data\matlab_file\HMM20best.mat')
%%
max_iter=80;
M = 1;%Number of mixtures 
Q = 10;          %Number of states 
%T = 132;         %Number of vectors in a sequence 
%nex = 37;        %Number of sequences
cov_type = 'full';
out = 1; % sequence to leave for testing

% initial guess of parameters
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));

%%
%data creation
data = transformHMMmatrix(all_struct.theo);
tdata= data;
data(:,:,out)=[]; %leave one out
O =size(data,1); %Number of coefficients in a vector 

  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[tLL, tprior1, ttransmat1, tmu1, tSigma1, tmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

tloglik = mhmm_logprob(data(:,10:40,3), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);

%%
%data creation
data= transformHMMmatrix(all_struct.violaris);

vdata=data;
data(:,:,out)=[]; %leave one ou
O =size(data,1); %Number of coefficients in a vector 


  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[vLL, vprior1, vtransmat1, vmu1, vSigma1, vmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

vloglik = mhmm_logprob(data(:,10:40,3), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1)

%%
%data creation
data= transformHMMmatrix(all_struct.kotsios);

kdata=data;
data(:,:,out)=[]; %leave one ou
O =size(data,1); %Number of coefficients in a vector  

  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[kLL, kprior1, ktransmat1, kmu1, kSigma1, kmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

kloglik = mhmm_logprob(data(:,10:40,3), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1)


%%
%data creation
data= transformHMMmatrix(all_struct.loizos);

ldata=data;
data(:,:,out)=[]; %leave one ou
O =size(data,1); %Number of coefficients in a vector 

  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[lLL, lprior1, ltransmat1, lmu1, lSigma1, lmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

lloglik = mhmm_logprob(data(:,10:40,3), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1)

%%
%data creation
data= transformHMMmatrix(all_struct.xristos);

xdata=data;
data(:,:,out)=[]; %leave one out
O =size(data,1); %Number of coefficients in a vector  

  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[xLL, xprior1, xtransmat1, xmu1, xSigma1, xmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

xloglik = mhmm_logprob(data(:,10:40,3), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1)
%%
data = tdata;
tloglik = mhmm_logprob(data(:,1:50,out), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,1:50,out), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,1:50,out), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,1:50,out), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,1:50,out), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
theo1=[tloglik  kloglik  vloglik lloglik xloglik]  
correctHMM(theo1,1);
%%
data = kdata;
tloglik = mhmm_logprob(data(:,1:50,out), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,1:50,out), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,1:50,out), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,1:50,out), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,1:50,out), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
kotsios2= [tloglik  kloglik  vloglik lloglik xloglik]
correctHMM(kotsios2,2);
%%
data = vdata;
tloglik = mhmm_logprob(data(:,1:50,out), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,1:50,out), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,1:50,out), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,1:50,out), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,1:50,out), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
viol3= [tloglik  kloglik  vloglik lloglik xloglik]
correctHMM(viol3,3);
%%
data = ldata;
tloglik = mhmm_logprob(data(:,1:50,out), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,1:50,out), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,1:50,out), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,1:50,out), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,1:50,out), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
loiz4= [tloglik  kloglik  vloglik lloglik xloglik]
correctHMM(loiz4,4);
%%
data = xdata;
tloglik = mhmm_logprob(data(:,1:50,out), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,1:50,out), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,1:50,out), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,1:50,out), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,1:50,out), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
xristos5= [tloglik  kloglik  vloglik lloglik xloglik]
correctHMM(xristos5,5);
