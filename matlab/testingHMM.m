max_iter=20;
mixtures=1;


data = (tparam)';

  O = size(data,1);          %Number of coefficients in a vector 
  M = mixtures;          %Number of mixtures 
  Q = 10;          %Number of states 
  T = 1;         %Number of vectors in a sequence 
  nex = size(data,2);        %Number of sequences 
  cov_type = 'full';

data = reshape(data, [O T nex]);

% initial guess of parameters
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));

  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));


[tLL, tprior1, ttransmat1, tmu1, tSigma1, tmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);


tloglik = mhmm_logprob(data(:,1,1:5), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);

%%%%%%
data = (kparam)';

  O = size(data,1);          %Number of coefficients in a vector 
  M = mixtures;          %Number of mixtures 
  Q = 10;          %Number of states 
  T = 1;         %Number of vectors in a sequence 
  nex = size(data,2);        %Number of sequences 
  cov_type = 'full';

data = reshape(data, [O T nex]);

% initial guess of parameters
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));

  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));


[vLL, vprior1, vtransmat1, vmu1, vSigma1, vmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);


vloglik = mhmm_logprob(data(:,1,1:5), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);

%%%%
data = (kparam)';

  O = size(data,1);          %Number of coefficients in a vector 
  M = mixtures;          %Number of mixtures 
  Q = 10;          %Number of states 
  T = 1;         %Number of vectors in a sequence 
  nex = size(data,2);        %Number of sequences 
  cov_type = 'full';

data = reshape(data, [O T nex]);

% initial guess of parameters
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));

  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));


[kLL, kprior1, ktransmat1, kmu1, kSigma1, kmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);


kloglik = mhmm_logprob(data(:,1,1:5), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);



data = (kparam)';
  O = size(data,1);          %Number of coefficients in a vector 
  M = mixtures;          %Number of mixtures 
  Q = 10;          %Number of states 
  T = 1;         %Number of vectors in a sequence 
  nex = size(data,2);        %Number of sequences 
  cov_type = 'full';
data = reshape(data, [O T nex]);
q= [10 15 1 51 12 1];
tloglik = mhmm_logprob(data(:,1,q), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,1,q), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,1,q), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);

kotsios=[tloglik  kloglik  vloglik]  

data = (tparam)';
  O = size(data,1);          %Number of coefficients in a vector 
  M = mixtures;          %Number of mixtures 
  Q = 10;          %Number of states 
  T = 1;         %Number of vectors in a sequence 
  nex = size(data,2);        %Number of sequences 
  cov_type = 'full';
data = reshape(data, [O T nex]);
q= [10 15 1 51 12 1];
tloglik = mhmm_logprob(data(:,1,q), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,1,q), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,1,q), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
theo= [tloglik  kloglik  vloglik] 

data = (vparam)';
  O = size(data,1);          %Number of coefficients in a vector 
  M = mixtures;          %Number of mixtures 
  Q = 10;          %Number of states 
  T = 1;         %Number of vectors in a sequence 
  nex = size(data,2);        %Number of sequences 
  cov_type = 'full';
data = reshape(data, [O T nex]);
q= [10 15 1 51 12 1];
tloglik = mhmm_logprob(data(:,1,q), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);
kloglik = mhmm_logprob(data(:,1,q), kprior1, ktransmat1, kmu1, kSigma1, kmixmat1);
vloglik = mhmm_logprob(data(:,1,q), vprior1, vtransmat1,vmu1, vSigma1, vmixmat1);
viol= [tloglik  kloglik  vloglik] 
