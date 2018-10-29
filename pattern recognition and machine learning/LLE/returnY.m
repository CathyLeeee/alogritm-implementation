
% function          : returnY
% Project           : LLE
% Description       :产生低维数据


function Y = returnY(W, G)

n = size(G, 2);  %n sampling points
w = zeros(n, n);

for i = 1:n
    G(i, i) = Inf;
    I = (G(:, i) < Inf);
    k = sum(I);
    w(I, i) = W(1:k, i);
end

M = eye(n) - w;
M = M' * M;

[V, D] = eig(M);
D = sum(D);
[D, I] = sort(D, 'ascend');
V = V(:, I);
Y = V(:, 1:2)';

end