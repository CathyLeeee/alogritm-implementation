
% function          : kNeighbor
% Project           : LLE
% Description       : Ñ°ÕÒk½üÁÚ

function G = kNeighbor(data, k)


n = size(data, 2);  %n sampling points

dis = pdist(data', 'euclidean');
G = squareform(dis, 'tomatrix');

M = ones(n) * Inf;
G_temp = G;
for j = 1:n
    G_temp(j, j) = Inf;
end
for i = 1:k
    [~, I] = min(G_temp);
    for j = 1:n
        M(I(j), j) = 1;
        M(j, I(j)) = 1;
        G_temp(I(j), j) = Inf;
    end
end
G = G .* M;

for j = 1:n
    G(j, j) = 0;
end
