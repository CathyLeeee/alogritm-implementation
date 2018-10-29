test_data=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/test.data');
test_label=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/test.label');
%test_map=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/test.map');
train_data=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/train.data');
train_label=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/train.label');
%train_map=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/train.map');

%train parameter
%%%train_data=train_data(1:1000,:);  %for test
%%%train_label=train_label(1:10000,:);  %for test

%P(c)
temp=tabulate(train_label);
pc=temp(:,3)/100;   %pc;class
%%%pc(3:20,1)=0.1; %for test 

%P(wn|c)
for i=1:length(train_data(:,1))
    train_data(i,1)=train_label(train_data(i,1));    %change the 1st row of train data  from doc number into classs number 
end
pwc=zeros(max(test_data(:,2)),20);  %(word,class)
for i=1:20  %class
    ctemp= train_data((train_data(:,1)==i),:) ;
    denominator=sum(ctemp(:,3))+length(pwc(:,1));
    for j=1:length(pwc(:,1))  %words
        wtemp=ctemp((ctemp(:,2)==j),:);
        numerator=sum(wtemp(:,3))+1;
        pwc(j,i)=numerator/denominator;
    end
end

%apply trained parameters on test data to classify
%%%test_data=test_data(1:10000,:);  %for test

%calculate conditional probability P(c|ti)

%on train data
train_data=load('E:/课程/2017年春/模式识别/hw/hw1/bayes/PRHW_bayes_data/20news-bydate-matlab/20news-bydate/matlab/train.data');
label1=zeros(max(train_data(:,1)),1); %doc
for i=1:length(label1)
    dtemp=train_data(((train_data(:,1)==i)),:); %for a doc
    likelihood=zeros(20,1);
    for j=1:20   %for a class
        likelihood(j)=sum(log(pwc(dtemp(:,2),j)).*dtemp(:,3));  %log likelihood
    end
    posterior=log(pc)+likelihood;
    label1(i)=find(posterior==max(posterior));
end
%evaluation
training_error=length(find(label1-train_label))/length(label1)

%on test data
label2=zeros(max(test_data(:,1)),1); %doc
for i=1:length(label2)
    dtemp=test_data(((test_data(:,1)==i)),:); %for a doc
    likelihood=zeros(20,1);
    for j=1:20   %for a class
        likelihood(j)=sum(log(pwc(dtemp(:,2),j)).*dtemp(:,3));  %log likelihood
    end
    posterior=log(pc)+likelihood;
    label2(i)=find(posterior==max(posterior));
end
%evaluation
test_error=length(find(label2-test_label))/length(label2)


