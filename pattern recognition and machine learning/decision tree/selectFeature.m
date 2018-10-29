% function          : selectFeature
% Project           : decision tree
% Description       :根据不纯度挑选特征

function [feature, posImp, negImp] = selectFeature(wordMat, doclabel, restIndex, impurity)

numAll = sum(restIndex);
deltaImp = -ones(1200, 1) * inf;
impPosArray = zeros(1200, 1);
impNegArray = zeros(1200, 1);

parfor i = 1:1200
    posIndex = restIndex & (wordMat(:, i) > 0);
    negIndex = restIndex & (wordMat(:, i) == 0);
    if sum(posIndex) ~= numAll && sum(negIndex) ~= numAll
        impPosArray(i) = calImpurity(doclabel, posIndex);
        impNegArray(i) = calImpurity(doclabel, negIndex);
        posPercentage = double(sum(posIndex)) / double(numAll);
        negPercentage = double(sum(negIndex)) / double(numAll);
        deltaImp(i) = impurity - posPercentage * impPosArray(i) - negPercentage * impNegArray(i);
    end
end

[M, feature] = max(deltaImp);
posImp = impPosArray(feature);
negImp = impNegArray(feature);

if M == -inf || posImp == inf || negImp == inf
    feature = -1;
end