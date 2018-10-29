function e = adaboost_error(X, y, k, a, d, alpha)
% adaboost_error: returns the final error rate of a whole adaboost
% 
% Input
%     X     : n * p matrix, each row a sample
%     y     : n * 1 vector, each row a label
%     k     : iter * 1 vector,  selected dimension of features
%     a     : iter * 1 vector, selected threshold for feature-k
%     d     : iter * 1 vector, 1 or -1
%     alpha : iter * 1 vector, weights of the classifiers
%
% Output
%     e     : error rate      

%%% my Code Here %%%
[n,~]=size(X);
iter=sum(k>0);

pred=zeros(n,iter);
for i=1:iter
    index=(X(:,k(i))<=a(i));
    pred(index,i)=d(i);
    pred(~index,i)=-d(i);
end

alpha=(alpha(alpha~=0))';
estimated_y=sign(sum(repmat(alpha,n,1).*pred,2));
e=sum(y~=estimated_y)/n;

%%% my Code Here %%%


end