function[label]=chebyshev(x,train_X,train_Y,k)

% x£º sample to be determined; row vector
% train_X: train data;matrix with every row a sample
% train_Y: train label

%chebyshev distance
distance=max((abs(bsxfun(@minus,train_X,x)))')';  

%select the label of top k
sorted_distance=sort(distance);
sorted_distance=sorted_distance(1:k);    
[~,ind]=find(bsxfun(@eq,distance',sorted_distance));
k_label=train_Y(ind);

temp=0:max(k_label);
[max_count,index]=max(histc(k_label,temp));
label=temp(index);

end


