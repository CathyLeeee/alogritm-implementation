

function [estimated_label, Je] = kmeans(data, C)

[N, M] = size(data);

estimated_label = ceil(rand(N, 1) * C);%Ëæ»ú³õÊ¼»¯

mu = zeros(C, M);
Je = 0;
sample_number_of_class = zeros(C, 1);
for i = 1:C
    I = (estimated_label == i);
    sample_number_of_class(i) = sum(I);
    mu(i, :) = sum(data(I, :), 1) / sample_number_of_class(i);
    Je = Je + sum(pdist2(mu(i, :), data(I, :)).^2);
end

index = 1;
n = 0;
while true
    n = n + 1;
    i = estimated_label(index);
 
    
    if sample_number_of_class(i) > 1
        rho = zeros(C, 1);
        for j = 1:C
            if j ~= i
                rho(j) = sample_number_of_class(j) / (sample_number_of_class(j) + 1) * (data(index, :) - mu(j, :)) * (data(index, :) - mu(j, :))';
            else
                rho(j) = sample_number_of_class(j) / (sample_number_of_class(j) - 1) * (data(index, :) - mu(j, :)) * (data(index, :) - mu(j, :))';
            end
        end
        [~, I] = min(rho);
        if i ~= I
            estimated_label(index) = I;
            Je = Je + rho(I) - rho(i);
            mu(i, :) = mu(i, :) + (mu(i, :) - data(index, :)) / (sample_number_of_class(i) - 1);
            mu(I, :) = mu(I, :) + (data(index, :) - mu(I, :)) / (sample_number_of_class(I) + 1);
            sample_number_of_class(i) = sample_number_of_class(i) - 1;
            sample_number_of_class(I) = sample_number_of_class(I) + 1;
            n = 0;
        end
    end
    
    index = mod(index, N);
    index = index + 1;
    if n >= N
        break;
    end
end

estimated_label=estimated_label-1;%1:10 to 0:9
end
