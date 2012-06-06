max_iter=20;
mixtures=1;


%data{:,:} = (User_Model_Sequences{:,1:132});

%c loops over sequences
%a loops over coefficients
%b loops in sequence
User_Model_Sequences = all_struct.theo;
for c=1:size(User_Model_Sequences,1)
    for a=1:size(User_Model_Sequences{c,1}{1,1},2)
        for b=1:size(User_Model_Sequences{c,1},2)  
 data(a,b,c) = User_Model_Sequences{c,1}{1,b}(:,a);
        end
    end
end
  O =size(User_Model_Sequences{1,1}{1,1},2); %Number of coefficients in a vector 
  M = mixtures;          %Number of mixtures 
  Q = 10;          %Number of states 
  %T = 132;         %Number of vectors in a sequence 
  %nex = 37;        %Number of sequences 
  cov_type = 'full';

%data = reshape(data, [O T nex]);

% initial guess of parameters
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));

  [mu0, Sigma0] = mixgauss_init(Q*M, data, cov_type);
  mu0 = reshape(mu0, [O Q M]);
  Sigma0 = reshape(Sigma0, [O O Q M]);
  mixmat0 = mk_stochastic(rand(Q,M));


[tLL, tprior1, ttransmat1, tmu1, tSigma1, tmixmat1] = ...
    mhmm_em(data, prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', max_iter);


tloglik = mhmm_logprob(data(:,1:50,36), tprior1, ttransmat1, tmu1, tSigma1, tmixmat1);