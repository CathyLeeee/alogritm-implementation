% function          : pruning
% Project           : decision tree
% Description       :ÑµÁ·¾ö²ßÊ÷


function [leaf_rules, leaf_class] = pruning(leaf_rules, leaf_class)

%% sort
[leaf_class, I] = sort(leaf_class);
leaf_rules = leaf_rules(I);

i_class = 0;
I_all = [];
for i = 1:9
    I_class = (leaf_class == i);
    leaf_rules_class = leaf_rules(I_class);
    s = cellfun(@(x) char(size(x)), leaf_rules_class, 'uniform', false);
    [~, I] = sort(s);
    %[~, I] = sort(cellfun('size', leaf_rules_class, 1), 'descend');
    I_all = [I_all, I + i_class];
    i_class = i_class + sum(I_class);
end

leaf_rules = leaf_rules(I_all);

%% pruning
I_delete = zeros(length(leaf_class), 1);

i_class = 1;
for i = 1:9
    classSum = sum(leaf_class == i);
    for j = i_class : i_class + classSum - 1
        rulej = cell2mat(leaf_rules(j));
        for k = j+1 : i_class + classSum
            useless = false;
            rulek = cell2mat(leaf_rules(k));
            for l = 1:length(rulej)
                if sum(rulej(l) == rulek) == 0
                    useless = true;
                    break;
                end
            end
            if useless
                I_delete(j) = 1;
                break;
            end
        end
    end
end

leaf_class = leaf_class(~I_delete);
leaf_rules = leaf_rules(~I_delete);
