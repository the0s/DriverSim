%%
%load('HMM_ALL_coeff');

%load('HMM_ALL_coeff_diff'); %results from that
load('HMM_ALL_ALLtracks');
%%
coefficients = [1:4,13:16,32, 29, 106:109];%right
%coefficients = [1:4,13:16,32,29, 106:108]; %left
conf_matrix= zeros(5,5); 
max_iter=40;
M =3;%Number of mixtures 
Q = 4;          %Number of states 
%T = 132;         %Number of vectors in a sequence 
%nex = 37;        %Number of sequences
cov_type = 'full';

out = 4; % sequence to leave for testing
for out=1:28

% initial guess of parameters
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));

%%
%data creation
data = transformHMMmatrix(all_struct.theo,coefficients);
tdata= data;
data(:,:,out)=[]; %leave one out
O =size(data,1); %Number of coefficients in a vector 

try
    [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
catch err
    err;
    [mu0, Sigma0] = mixgauss_init(Q*M, data, 'spherical');
end
    
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[tLL, tprior1, ttransmat1, tmu1, tSigma1, tmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

tloglik = mhmm_logprob(data(:,10:40,3), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1)

%%
%data creation
data= transformHMMmatrix(all_struct.violaris,coefficients);

vdata=data;
data(:,:,out)=[]; %leave one ou
O =size(data,1); %Number of coefficients in a vector 


  try
  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
catch
    [mu0, Sigma0] = mixgauss_init(Q*M, data, 'spherical');
    end
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[vLL, vprior1, vtransmat1, vmu1, vSigma1, vmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

vloglik = mhmm_logprob(data(:,10:40,3), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1)

%%
%data creation
data= transformHMMmatrix(all_struct.kotsios,coefficients);

kdata=data;
data(:,:,out)=[]; %leave one ou
O =size(data,1); %Number of coefficients in a vector  

  try
  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
catch
    [mu0, Sigma0] = mixgauss_init(Q*M, data, 'spherical');
    end
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[kLL, kprior1, ktransmat1, kmu1, kSigma1, kmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

kloglik = mhmm_logprob(data(:,10:40,3), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1)


%%
%data creation
data= transformHMMmatrix(all_struct.loizos,coefficients);

ldata=data;
data(:,:,out)=[]; %leave one ou
O =size(data,1); %Number of coefficients in a vector 

  try
  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
catch
    [mu0, Sigma0] = mixgauss_init(Q*M, data, 'spherical');
    end
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[lLL, lprior1, ltransmat1, lmu1, lSigma1, lmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

lloglik = mhmm_logprob(data(:,10:40,3), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1)

%%
%data creation
data= transformHMMmatrix(all_struct.xristos,coefficients);

xdata=data;
data(:,:,out)=[]; %leave one out
O =size(data,1); %Number of coefficients in a vector  

  try
  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
catch
    [mu0, Sigma0] = mixgauss_init(Q*M, data, 'spherical');
    end
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));

[xLL, xprior1, xtransmat1, xmu1, xSigma1, xmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);

xloglik = mhmm_logprob(data(:,10:40,3), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1)
%%
sequence = 100:180;

data = tdata;
tloglik = mhmm_logprob(data(:,sequence,out+10), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,sequence,out+10), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,sequence,out+10), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,sequence,out+10), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,sequence,out+10), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
theo1=[tloglik  kloglik  vloglik lloglik xloglik]  
[pre(1,out), who] =correctHMM(theo1,1);
conf_matrix = confusion_matrix(pre(1,out),who, 1,conf_matrix);
%%
data = kdata;
tloglik = mhmm_logprob(data(:,sequence,out+5), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,sequence,out+5), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,sequence,out+5), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,sequence,out+5), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,sequence,out+5), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
kotsios2= [tloglik  kloglik  vloglik lloglik xloglik]
[pre(2,out), who] =correctHMM(kotsios2,2);
conf_matrix = confusion_matrix(pre(2,out),who, 2,conf_matrix);
%%
data = vdata;
tloglik = mhmm_logprob(data(:,sequence,out), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,sequence,out), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,sequence,out), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,sequence,out), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,sequence,out), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
viol3= [tloglik  kloglik  vloglik lloglik xloglik]
[pre(3,out), who] =correctHMM(viol3,3);
conf_matrix = confusion_matrix(pre(3,out),who, 3,conf_matrix);
%%
data = ldata;
tloglik = mhmm_logprob(data(:,sequence,out+10), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,sequence,out+10), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,sequence,out+10), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,sequence,out+10), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,sequence,out+10), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
loiz4= [tloglik  kloglik  vloglik lloglik xloglik]
[pre(4,out) , who]=correctHMM(loiz4,4);
conf_matrix = confusion_matrix(pre(4,out),who, 4,conf_matrix);
%%
data = xdata;
tloglik = mhmm_logprob(data(:,sequence,out+10), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,sequence,out+10), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,sequence,out+10), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
lloglik = mhmm_logprob(data(:,sequence,out+10), lprior1, ltransmat1, lmu1, lSigma1, lmixmat1);
xloglik = mhmm_logprob(data(:,sequence,out+10), xprior1, xtransmat1, xmu1, xSigma1, xmixmat1);
xristos5= [tloglik  kloglik  vloglik lloglik xloglik]
[pre(5,out) , who]= correctHMM(xristos5,5);
conf_matrix = confusion_matrix(pre(5,out),who, 5,conf_matrix)
out
end
success=  sum(diag(conf_matrix))/ sum(conf_matrix(:))