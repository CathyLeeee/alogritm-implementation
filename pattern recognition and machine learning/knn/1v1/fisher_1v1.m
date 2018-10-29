% Description       :  calcualte w for 2 classes 
% 

function w = fisher_1v1(data1, data2)

[~, D] = size(data1);

m1 = mean(data1, 1);
m2 = mean(data2, 1);

S_W = zeros(D);

for i = 1:size(data1, 1)
    S_W = S_W + (data1(i,:) - m1)' * (data1(i,:) - m1);
end

for i = 1:size(data2, 1)
    S_W = S_W + (data2(i,:) - m2)' * (data2(i,:) - m2);
end

w = (m1 - m2) * pinv(S_W');
