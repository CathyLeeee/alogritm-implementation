function[label]=manifold(x,train_X,train_Y,k)

% x£º sample to be determined; row vector
% train_X: train data;matrix with every row a sample
% train_Y: train label

%manifold distance
trans_train_X=train_X;
distance=zeros(length(train_X(:,1)),1);
for n=1:length(train_X(:,1))
    M=reshape(train_X(n,:),28,28);
    M(1:10,:)=0;
    trans_train_X(n,:)=M(:); 
end
T=trans_train_X-train_X;   %tangant vector
x_x=bsxfun(@minus,trans_train_X,x);
T=bsxfun(@minus,T,mean(T,2));
a=x_x\T ;          
distance=sum((bsxfun(@minus,train_X+a(1:500,:).*T,x).^2),2);

%select the label of top k
sorted_distance=sort(distance);
sorted_distance=sorted_distance(1:k);    
[~,ind]=find(bsxfun(@eq,distance',sorted_distance));
k_label=train_Y(ind);

temp=0:max(k_label);
[max_count,index]=max(histc(k_label,temp));
label=temp(index);

end
