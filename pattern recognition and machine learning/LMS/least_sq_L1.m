function w = least_sq_L1(X, y, lambda, w_0)
% least_sq_L1 solves the least square problem with L1-norm penalty
%
% Inputs 
%     X      : n * M matrix, each row a sample with M features
%     y      : n * 1 vector, each element a target
%     lambda : the penalty constant
%     w_0    : M * 1 vector, the initial weight 
%
% Outputs
%     w      : M * 1 vector, the weight vector

[n, M] = size(X); % n samples, each with M features

% precompute a_k's, since they don't vary when w is updated
a = sum(X .* X)' / n; % M * 1 vector

w = w_0;
iter = 0;
err_tol = 1e-8;
while (1)
  max_err = 0;
  for k = 1:M
    % evaluate c(k) based on w and X 
    %%% my code here %%%
    c(k) = sum(X(:,k) .* (y - X * w + X(:,k) .* w(k)))/n;
    %%% my code here %%%
    
    % update w(k)
    %%% my code here %%%
    if c(k) < -lambda
        w(k) = (c(k) + lambda) / a(k);
    elseif c(k) > lambda
        w(k) = (c(k) - lambda) / a(k);
    else
        w(k) = 0;
    end
    %%% my code here %%%
  end
  
  iter = iter + 1;
  if (max_err < err_tol) 
      return; 
  end

end