
% function          : returnG
% Project           : ISOMAP
% Description       : return geodesic distance matrix



function G = returnG(data)

n = size(data, 2);  %number of points
dis = pdist(data', 'euclidean');
G = squareform(dis, 'tomatrix');


r=0.5;  % user-defined radius
G(G>0.5)=Inf;

for iteration=1:2
    
for j = 1:n
        for k = 1:n
            G(:, j) = min(G(:, j), G(:, k) + G(k, j));
        end
 end

for j = 1:n
    G(j, j) = 0;
end

end

end



