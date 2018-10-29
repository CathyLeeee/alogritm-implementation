clear all;
close all;
clc;
%% load mnist data
load('mnist.mat');

data=zeros(1000,784);
label=zeros(1000,1);
for i=0:9
    temp=train_X(train_Y==i,:);
    data(1+100*i:100+100*i,:)=temp(1:100,:);
    label(1+100*i:100+100*i,:)=i;
end

 
%% spectral clustering
tic;
[estimated_label, Je] = spectral(data, 10);
toc;


%% 最后显示聚类后的数据

%draw(data,estimated_label,'spectral(euclidean)')
%draw(data,estimated_label,'spectral(cityblock)')
draw(data,estimated_label,'spectral(minkowski)')
%% evaluation of clustering
 nmi = calNMI(label, estimated_label)



 