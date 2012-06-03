
  O = 8;          %Number of coefficients in a vector 
  T = 420;         %Number of vectors in a sequence 
  nex = 1;        %Number of sequences 
  M = 1;          %Number of mixtures 
  Q = 6;          %Number of states 
  
%data = normalise(load('angle101good.csv'))';
data = (param)';
%data = data(1:1000,1:5);

  O = size(data,1);          %Number of coefficients in a vector 
  M = 1;          %Number of mixtures 
  Q = 10;          %Number of states 
  T = 1;         %Number of vectors in a sequence 
  nex = size(data,2);        %Number of sequences 
  cov_type = 'full';

%data = randn(O,T,nex);
data = reshape(data, [O T nex]);

% initial guess of parameters
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));

if 0
  Sigma0 = repmat(eye(O), [1 1 Q M]);
  % Initialize each mean to a random data point
  indices = randperm(T*nex);
  mu0 = reshape(data(:,indices(1:(Q*M))), [O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));
else
  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));
end


[LL, prior1, transmat1, mu1, Sigma1, mixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', 10);


loglik = mhmm_logprob(data(:,1,1:5), prior1, transmat1, mu1, Sigma1, mixmat1);

