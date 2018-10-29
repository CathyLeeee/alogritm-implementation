% function            :  MDS
% Project             : ISOMAP
% Description         : find a set of points in a lower dimensional space by Multidimensional Scaling


function X = MDS(G)

n = size(G, 1);

A = G .^2;  %squared proximity matrix
J = eye(n) - 1/n * ones(n);  %centering matrix
B = -0.5*J * A * J;  
[V, D] = eig(B);

D = sum(real(D));
[D, I] = sort(D, 'descend');
V = V(:, I);
V = real(V .* repmat(sqrt(D), n, 1));

X = V(:, 1:2)';
end
