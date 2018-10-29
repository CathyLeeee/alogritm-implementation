%% initialization
load('orl_faces.mat');
data=data(1:100,:);   %select 100 samples
label=label(1:100,:);

%% reduce dimension with fisher one-vs-one
data_1v1=zeros(100,45);
l=1;
for i = 1:9
    for j = i+1:10
        w = fisher_1v1(data(label==i,:), data(label==j,:));
        data_1v1([(1:10)+10*(i-1),(1:10)+10*(j-1)],l)=[data(label==i,:);data(label==j,:)]*w';
        l=l+1;
    end
end

data=zeros(100,9);
for i=1:100
    temp=data_1v1(i,:);
    temp(temp==0)=[];
    data(i,:)=temp;
end

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

accuracy_1v1=length(find((mylabel-test_label)==0))/length(test_label);

