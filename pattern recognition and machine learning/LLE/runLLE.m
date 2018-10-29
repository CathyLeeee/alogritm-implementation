
% function          : main function
% Project           : LLE
% Description       : reduce "3" shape in 3D to 2D by LLE



%% original 3 in 3D
data = gen3(1000); 
figure(1);
clf(1);
scatter3(data(1, :), data(2, :), data(3, :));
view(-30,10);
hold on;
title('original 3-Shape in 3D');
hold off;

%% LLE
[W, G] = returnW(data,20);
Y = returnY(W, G);

%% Draw reduced N-shape in 2D
figure(2);
clf(2);
hold on;
scatter(Y(1, :), Y(2, :));
title('LLE, reduced 3-Shape in 2D');
hold off;

