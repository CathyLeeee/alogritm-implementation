%% generate sample 
%data1   marked as 1
data1(:,1)=5*rand(100,1);
data1(:,2)=5*rand(100,1)+5; 
%data2   marked as -1
data2(:,1)=5*rand(100,1)+10;
data2(:,2)=5*rand(100,1); 
data=[data1;-data2];    %规范化后的样本


%% classical perceptron algorithm
%initilaization
alpha=[0,0];
gc=zeros(length(data(:,1)),1);

%iteration
while length(find(gc<=0))
    gc=data*alpha'; %判别函数 for classic
    alpha=alpha+sum(data(find(gc<=0),:));
end

% plot sample 
plot(data1(:,1),data1(:,2),'go','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',5)
hold on
plot(data2(:,1),data2(:,2),'cs','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',5)
hold on
axis([0 15 0 15])
grid on
T=legend('#1','#-1');
set(T,'Fontsize',12);      %设置图标字体大小
hold on 
x=linspace(0,15);
plot(x,(-alpha(1)/alpha(2))*x);


%% margin perceptron algorithm
%initilaization
gamma=[10,100,1000,10000,100000,1000000,10000000];
gcount=zeros(length(gamma),1);
for j=1:length(gamma)
%iteration
    count=0;    %count for iteration times
    alpha=[0,0];
    gc=zeros(length(data(:,1)),1);
    while length(find(gc<=0))
        gc=data*alpha'-gamma(j); %判别函数 for classic
        alpha=alpha+sum(data(find(gc<=0),:));
        count=count+1;
    end
    gcount(j)=count;
end

% plot sample 
for i=1:length(gamma)
% plot sample 
plot(data1(:,1),data1(:,2),'go','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',5)
hold on
plot(data2(:,1),data2(:,2),'cs','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',5)
hold on
axis([0 15 0 15])
grid on
T=legend('#1','#-1');
set(T,'Fontsize',12);      %设置图标字体大小
hold on 
x=linspace(0,15);
plot(x,((-galpha(i,1)*x+gamma(i))/galpha(i,2)));
end



    
