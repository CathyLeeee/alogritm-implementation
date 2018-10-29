function [k, a, d] = decision_stump(X, y, w)
% decision_stump returns a rule ...
% h(x) = d if x(k) <=?a; -d otherwise,
%
% Input
%     X : n * p matrix, each row a sample
%     y : n * 1 vector, each row a label
%     w : n * 1 vector, each row a weight
%
% Output
%     k : the optimal dimension
%     a : the optimal threshold
%     d : the optimal d, 1 or -1

% total time complexity required to be O(p*n*logn) or less
%%% my Code Here %%%
[n,p]=size(X);
optimal_d=zeros(p,1);
optimal_a=zeros(p,1);
error=zeros(p,1);
for j=1:p
    [Xj,index]=sort(X(:,j));
    y=y(index);
    w=w(index);
    ysum=cumsum(y.*w);
    [mi,Imin]=min(ysum);
    [ma,Imax]=max(ysum);
    if abs(ma)>abs(mi)
        optimal_d(j)=1;
        optimal_a(j)=Xj(Imax);
        pred=[ones(Imax,1);-ones(n-Imax,1)];
        error(j)=sum((pred~=y).*w);
    else
        optimal_d(j)=-1;
        optimal_a(j)=Xj(Imin);
        pred=[-ones(Imax,1);ones(n-Imax,1)];
        error(j)=sum((pred~=y).*w);
    end     
end

[~,k]=min(error);
a=optimal_a(k);
d=optimal_d(k);

%%% my Code Here %%%
end