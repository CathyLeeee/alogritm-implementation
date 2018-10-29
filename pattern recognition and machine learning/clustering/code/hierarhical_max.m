

function [estimated_label, Je] = hierarhical_max(data, C)

[N, M] = size(data);

estimated_label = 1:N;
estimated_label = estimated_label';

dis = ;
G = squareform(pdist(data, 'euclidean'), 'tomatrix');
for c = N:-1:C+1
    G = G(1:c, 1:c);
    dis = squareform(G, 'tovector');
    
    mindis = min(dis);
    [I, J] = find(G == mindis);
    i = min(I(1), J(1));
    j = max(I(1), J(1));

    estimated_label(estimated_label == j) = i;
    estimated_label(estimated_label == c) = j;
    
    G(:, i) = max(G(:, i), G(:, j));
    G(i, :) = G(:, i)';
    G(:, j) = G(:, c);
    G(j, :) = G(c, :);
    G(i, i) = 0;
end

Je = 0;
mu = zeros(C, M);
for i = 1:C
    I = (estimated_label == i);
    mu(i, :) = sum(data(I, :), 1) / sum(I);
    Je = Je + sum(pdist2(mu(i, :), data(I, :)).^2);
end

estimated_label=estimated_label-1;%1:10 to 0:9

end
