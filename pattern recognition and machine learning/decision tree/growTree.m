% function          : growTree
% Project           : decision tree
% Description       : 递归生成决策树


function [rules, leaf_rules, leaf_class] =  growTree(train_wordMat, train_doclabel, restIndex, impurity, rules, leaf_rules, leaf_class)

[feature, posImp, negImp] = selectFeature(train_wordMat, train_doclabel, restIndex, impurity);

preRule = cell2mat(rules(end));

if feature <= 0 || length(preRule) > 50 || sum(restIndex) < 10  % leaf
    leaf_rules(end+1) = { preRule };
    leaf_class = [leaf_class, mode(train_doclabel(restIndex))];
    return;
end

posIndex = restIndex & (train_wordMat(:, feature) > 0);
negIndex = restIndex & (train_wordMat(:, feature) == 0);

if sum(posIndex) == sum(restIndex) || sum(negIndex) == sum(restIndex) % leaf
    leaf_rules(end+1) = { preRule };
    leaf_class = [leaf_class, mode(train_doclabel(restIndex))];
    return;
end

posPercentage = double(sum(posIndex)) / double(sum(restIndex));
negPercentage = double(sum(negIndex)) / double(sum(restIndex));
deltaImp = impurity - posPercentage * posImp - negPercentage * negImp;



if deltaImp < inf
    rules(end+1) = { [preRule, feature] };
    [rules, leaf_rules, leaf_class] = growTree(train_wordMat, train_doclabel, posIndex, posImp, rules, leaf_rules, leaf_class);
    
    rules(end+1) = { [preRule, -feature] };
    [rules, leaf_rules, leaf_class] = growTree(train_wordMat, train_doclabel, negIndex, negImp, rules, leaf_rules, leaf_class);
else % leaf
    leaf_rules(end+1) = { preRule };
    leaf_class = [leaf_class, mode(train_doclabel(restIndex))];
end
