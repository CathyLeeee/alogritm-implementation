% function          : mian function
% Project           : decision tree
% Description       : 使用decision tree完成对sougou data的分类

%% train data
data=load('Sogou_webpage.mat');
doclabel = int16(data.doclabel);
wordMat = int16(data.wordMat);
%rn=randperm(14400);
train_wordMat=wordMat(rn(1:1000),:);
train_doclabel=doclabel(rn(1:1000),:);

%% grow tree on train data

[leaf_rules, leaf_class] = runGrowTree(train_wordMat, train_doclabel);

%% pruning
%[leaf_rules, leaf_class] = pruning(leaf_rules, leaf_class);


%% predict on test data
test_wordMat=wordMat(rn(1001:1200),:);
test_doclabel=doclabel(rn(1001:1200),:);
[myLabel,correctRate] = predict( train_wordMat, train_doclabel, leaf_rules, leaf_class);
