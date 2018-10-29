mnist=load('E:/课程/2017年春/模式识别/hw/hw5/mnist.mat');
rrn=randperm( size(mnist.train_X,1) ); %random row numbers

tic;

%st=[50,100,500,1000,2000,5000];    %size of train data
st=500;
%k=[2,3,4,5,6,7];
k=4;
%k=1;   %k nearest neighbor
%random sampling from original train data
train_X=mnist.train_X(rrn,:);

%%%orthgonalization
M=(orth(train_X)\train_X)';
m=mean(M,2)';
%%%orthgonalization

train_Y=mnist.train_Y(rrn);
%for j=1:length(k)
%train data    
train_X=train_X(1:st,:);   %different size of train data
train_Y=train_Y(1:st);   %different size of train data
%test data
test_X=mnist.test_X;
test_Y=mnist.test_Y;

%orthgonalization
train_X=bsxfun(@times,train_X,m);
test_X=bsxfun(@times,test_X,m);


label=zeros(1,length(test_Y));  %N=length(test_Y) samples to be determined in test_Y

for n=1:length(test_Y)
    x=test_X(n,:);
    label(n)=euclidean(x,train_X,train_Y,k);
    %label(n)=manhattan(x,train_X,train_Y,k);
    %label(n)=chebyshev(x,train_X,train_Y,k);
end
   
accuracy=length(find((label-test_Y)==0))/length(test_Y);

%end

toc;