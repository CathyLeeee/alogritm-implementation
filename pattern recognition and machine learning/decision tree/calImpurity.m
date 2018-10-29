% function          : calImpurity
% Project           : decision tree
% Description       : ¼ÆËã²»´¿¶È

function impurity = calImpurity(doclabel, restIndex)

numAll = sum(restIndex);

doclabel_rest = doclabel(restIndex);

num = int16(zeros(9, 1));
for i = 1:9
    num(i) = sum(doclabel_rest == i);
end

I = (num > 0);
if sum(I) <= 1
    impurity = inf;
    return;
end
num = num(I);

impurity = 0;
for i = 1:length(num)
    p = double(num(i)) / double(numAll);
    impurity = impurity - p *log(p);           %entropy impurity
end
