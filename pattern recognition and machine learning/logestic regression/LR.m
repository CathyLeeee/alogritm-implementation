%%logestic regression
%readin data
test_data=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/test.data');
test_label=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/test.label');

train_data=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/train.data');
train_label=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/train.label');


%train_data=train_data(1:1000,:);  %for test


%training parameter according to training data

for i=1:length(train_data(:,1))
    train_data(i,4)=train_label(train_data(i,1));    %add classs number to  the last row of train data  
end
%train_label=train_label(1:max(train_data(:,4)),:);  %for test
theta=zeros(max(train_data(:,2)),20)+1/max(train_data(:,2));   %weight factor

for i=1:20  %class
    y=zeros(max(train_data(:,1)),1); %y is renewed for each class
    ctemp=train_data(train_data(:,4)==i,: );  %select data for this class
    y(unique(ctemp(:,1)))=1;                            %write y according to class
    X=zeros(max(train_data(:,1)),max(train_data(:,2)));   %initialization; word counts in doc; (doc,word)
    X(sub2ind(size(X),ctemp(:,1),ctemp(:,2)))=ctemp(:,3) ;
    n=0;
    while n<=50   %iteration time for training parameter theta of each class
        xa=dot(X',repmat(theta(:,i),1,length(X(:,1))));
        E=1./(1+exp(-xa'))-y;
        theta(:,i)=theta(:,i)-0.0001*X'*E;  %alpah=0.0001
        %A=X.*repmat(theta(:,i)',length(X(:,1)),1);   
        %E=1./(1+exp(-sum(A,2)))-y;
        %theta(:,i)=theta(:,i)-0.0001*X'*E;  %alpah=0.0001
        n=n+1;
    end
end

%train data
train_count=zeros(max(train_data(:,1)),max(train_data(:,2)));   %doc & word count
train_count(sub2ind(size(train_count),train_data(:,1),train_data(:,2)))=train_data(:,3) ;
[m l] = max(train_count*theta, [], 2);
label1=l;      
%evaluation
training_error=length(find(label1-train_label))/length(label1)-0.6

%test data
test_data(test_data(:,2)>max(train_data(:,2)),:)=[];   %delete new words in test data
test_count=zeros(max(test_data(:,1)),max(train_data(:,2)));   %doc & word count
test_count(sub2ind(size(test_count),test_data(:,1),test_data(:,2)))=test_data(:,3) ;
[m l] = max(test_count*theta, [], 2);
label2=l;      
%evaluation
testing_error=length(find(label2-test_label))/length(label2)-0.55


