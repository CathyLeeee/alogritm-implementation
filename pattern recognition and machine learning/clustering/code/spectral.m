

function [estimated_label, Je] = spectral(data, C)

[N, M] = size(data);

% W = squareform(pdist(data, 'euclidean'), 'tomatrix');    % similarity:euclidean distance
%W = squareform(pdist(data, 'cityblock'), 'tomatrix');      %similarity:cityblock distance
 W = squareform(pdist(data, 'minkowski'), 'tomatrix');      % similarity:minkowski distance



D = diag(sum(W));

%L = D-W;    %未归一化
L=eye(N)-W/D;   %归一化


[V, D] = eig(L);
[~, I] = sort(sum(D), 'descend');
U = V(:, I);
U = U(:, 1:C);

[estimated_label,~] = kmeans(U, C);

mu = zeros(C, M);
Je = 0;
for i = 1:C
    I = (estimated_label == i);
    mu(i, :) = sum(data(I, :), 1) / sum(I);
    Je = Je + sum(pdist2(mu(i, :), data(I, :)).^2);
end

estimated_label=estimated_label-1;%1:10 to 0:9

end
