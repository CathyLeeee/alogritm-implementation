
% function          : returnW
% Project           : LLE
% Description       : 根据近邻产生weight matrix 


function [W, G] = returnW(data, k)
n = size(data, 2);  %n sampling points
G = kNeighbor(data, k);


W = zeros(k, n);
for i = 1:n
   temp = G(:, i);
   temp =temp((temp > 0)&(temp < Inf));
    Q =temp *temp';
    k = size(Q, 1);
    Q = Q + 10 * eye(k);
    Q_inv = inv(Q);
    sumQ = sum(sum(Q_inv));
    for j = 1:k
        W(j, i) = sum(Q_inv(j, :)) / sumQ;
    end
end


end