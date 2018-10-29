% function          : main function
% Project           : ISOMAP
% Description       : reduce "N" shape in 3d to 2d by ISOMAP


%% origina N-shape in 3D
data= genN(1000);  %generate N shape composed of 1000 data points
figure(1);
clf(1);
scatter3(data(1, :), data(2, :), data(3, :));
hold on;
title('original N-Shape in 3D');
hold off;

%% ISOMAP
G = returnG(data);  %construct G
X = MDS(G);
%% Draw reduced N-shape in 2D
figure(2);
clf(2);
hold on;
scatter(X(1, :), X(2, :));
title('ISOMAP, reduced N-Shape in 2D');
hold off;
