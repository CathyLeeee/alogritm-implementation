% function          : runGrowTree
% Project           : decision tree
% Description       :ÑµÁ·¾ö²ßÊ÷


function [leaf_rules, leaf_class] = runGrowTree(train_wordMat, train_doclabel)

restIndex = (train_doclabel > 0); % all
impurity = calImpurity(train_doclabel, restIndex);
feature = selectFeature(train_wordMat, train_doclabel, restIndex, impurity);


posIndex = restIndex & (train_wordMat(restIndex, feature) > 0);
negIndex = restIndex & (train_wordMat(restIndex, feature) == 0);

leaf_rules(1) = { feature };
leaf_class = [];

rules(1) = { feature };
[rules, leaf_rules, leaf_class] = growTree(train_wordMat, train_doclabel, posIndex, impurity, rules, leaf_rules, leaf_class);
rules(end+1) = { -feature };
[rules, leaf_rules, leaf_class] = growTree(train_wordMat, train_doclabel, negIndex, impurity, rules, leaf_rules, leaf_class);

leaf_rules = leaf_rules(2:end);

