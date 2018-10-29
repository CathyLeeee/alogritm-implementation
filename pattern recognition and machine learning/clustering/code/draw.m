

function draw(data, label, figname)

[~, score] = pca(data);
X = score(:, 1:2);

figure(1);
clf(1);
hold on;
scatter(X(:,1), X(:,2), [], label,'+');
title(figname);
hold off;

end