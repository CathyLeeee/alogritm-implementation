% function          : predict
% Project           : decision tree
% Description       :使用训练好的决策树对测试样本分类

function [myLabel,correctRate] = predict(test_wordMat, test_doclabel, leaf_rules, leaf_class)

myLabel = int16(zeros(length(test_doclabel), 1));

parfor i = 1:length(test_doclabel)
    temp_wordMat = test_wordMat(i, :);
    for j = 1:length(leaf_class)
        rule = cell2mat(leaf_rules(j));
        posRule = rule(rule > 0);
        negRule = -rule(rule < 0);
        
        obeyRule = true;
        for k = 1:length(posRule)
            if temp_wordMat(posRule(k)) ~= 1
                obeyRule = false;
                break;
            end
        end
        if ~obeyRule
            continue;
        end
        
        for k = 1:length(negRule)
            if temp_wordMat(negRule(k)) ~= 0
                obeyRule = false;
                break;
            end
        end
        if ~obeyRule
            continue;
        end
        
        myLabel(i) = leaf_class(j);
        break;
    end
end

correctRate = double(sum(myLabel == test_doclabel)) / double(length(test_doclabel));
