
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

 

%% hierarhical clustering
 tic;
 [estimated_label_average, Je] = hierarhical_average(data, 10);
%[estimated_label_min, Je] = hierarhical_min(data, 10);
% [estimated_label_max, Je] = hierarhical_max(data, 10);
 toc;

%% 最后显示聚类后的数据

draw(data,estimated_label_average,'hierarhical(average)')
%draw(data,estimated_label_min,'hierarhical(min)')
%draw(data,estimated_label_max,'hierarhical(max)')


%% evaluation of clustering
  nmi_average = calNMI(label, estimated_label_average)
%  nmi_min= calNMI(label, estimated_label_min)
%  nmi_max= calNMI(label, estimated_label_max)


 

