load('ada_data.mat');


[e_train, e_test] = adaboost(X_train, y_train, X_test, y_test,300);
e_train=e_train1;
e_test=e_test1;
figure;
hold on;
f1 = plot(e_train, 'r');
f2 = plot(e_test, 'b');
legend([f1, f2], 'train error', 'test error');
xlabel('iteration times');
ylabel('error rate');
title('AdaBoost');
hold off;

