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

 

%% k-means clustering
  tic;
% % % test_times=10;
% % % M_estimated_label=zeros(1000,test_times);
% % % L_Je=zeros(test_times,1);
% % % for count=1:test_times
% % %    [estimated_label,Je] = kmeans(data,10);
% % %    M_estimated_label(:,count)=estimated_label;
% % %    L_Je(count)=Je;
% % % end
% % 
[estimated_label,Je] = kmeans(data,10);
 toc;
% % 
% 
%% 最后显示聚类后的数据
% draw(data,label,'theoretically')
draw(data,estimated_label,'k-means')

%% evaluation of clustering
% L_nmi=zeros(test_times,1);
% for count=1:test_times
%    L_nmi(count) = calNMI(label, M_estimated_label(:,count));
% end
% scatter(L_Je, L_nmi);
% xlabel('Je');
% ylabel('NMI');
% 
nmi = calNMI(label, estimated_label)


%% determine the cluster number
% tic;
% nclass=20;
% L_Je=zeros(nclass,1);  
% L_my=zeros(nclass,1);  
% for i=1:nclass
%   
%  [~,L_Je(i)] =kmeans(data,i);
%  L_my(i)=L_Je(i)+exp(i);
% end
% %plot(1:nclass,L_Je)
% plot(1:nclass,L_my)
% xlabel('number of cluster')
% ylabel('adjusted Je')
% toc;
%  

 
 
 


   