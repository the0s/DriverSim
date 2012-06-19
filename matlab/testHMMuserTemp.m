%%
%data
load('C:\Users\The0s\Desktop\Project Files\Project\DriverSim\matlab\theoHMMmean.mat')
%%
max_iter=80;
M = 1;%Number of mixtures 
Q = 8;          %Number of states 
%T = 132;         %Number of vectors in a sequence 
%nex = 37;        %Number of sequences
cov_type = 'full';
out = [1]; % sequence to leave for testing

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
data = tdata;
tloglik = mhmm_logprob(data(:,1:50,out), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);

%B = mk_dhmm_obs_lik(data, obsmat) 
%Then you can use
%[path, loglik] = viterbi_path(prior, transmat, B)  