tic;

%% initialization
load('orl_faces.mat');
data=data(1:100,:);   %select 100 samples
label=label(1:100,:);

%% reduce dimension with fisher one-vs-one

m = mean(data, 1);

S_W = zeros(size(data,2));
S_B = zeros(size(data,2));

for k = 1:10
    data_k=data(label==k,:);
    mk = mean(data_k, 1);
    N_k = sum(label==k);
    for i = 1:N_k
        S_W = S_W + (data_k(i, :) - mk)' * (data_k(i, :) - mk);
    end
    S_B = S_B + N_k * (mk - m)' * (mk - m);
end


A = pinv(S_W) * S_B;

[V, lamda] = eig(A);
V=[V,diag(lamda)];
V=sortrows(V,-length(V(1,:)));   %sort egi vector according to egi values


data=data*V(:,1:9);

%% select samples for training and testing
test_data=data(1:5:100,:);   %20/100 samples for test
train_data=data;
train_data(1:5:100,:)=[];
test_label=label(1:5:100);    %80/100 samples for train
train_label=label;
train_label(1:5:100)=[];

%% knn with k=4
k=4;
mylabel=zeros(length(test_label),1);
for i=1:length(test_label)
    mylabel(i)=KNN(test_data(i,:),train_data,train_label,k);
end

accuracy_multi=length(find((mylabel-test_label)==0))/length(test_label)


toc;


 