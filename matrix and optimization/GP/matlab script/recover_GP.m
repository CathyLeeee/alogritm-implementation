nnn=30%仿真次数 
a=1:nnn;
b=zeros(nnn,1);
c=zeros(nnn,1);
count=1
while count<nnn

%初始化算法参数和测量矩阵A，测量信号r

z=rand(512,1); %算法参数z

lamda=0.002;    %算法参数，lamda取值越大得到的解越稀疏
rou=0.5; %算法参数，Armijo步长回调因子，取值在（0,1）间，其大小影响步长下调速度
alpha=0.05;  %算法参数，Armijo条件不等式中系数,影响Armijo条件
A=normrnd(0,1/160,[160,256]);   % 测量矩阵A是160*256的随机矩阵，其元素服从正态分布N（0,1/160）
K=10; %稀疏度
p=K/256;  %由稀疏度决定二项分布概率
x0=binornd(1,p,256,1);  %产生原信号x0,256*1,其每个元素服从二项分布 
r=A*x0;% 获得线性测量
%r=A*x0+normrnd(0,0.01,[160,1]);  %noise ~N(0,1)
%r=r-normrnd(0,0.01,[160,1]);   %denosie balance

%GP算法迭代停止条件：小于误差范围或者达到规定迭代次数
e=0.01;  %允许误差程度,GP算法收敛条件
n=20000;   %GP算法迭代次数

[x]=f_iteration(z,rou,alpha,A,r,n,e,lamda);
x(abs(x)<0.3)=0;
x(abs(x)>=0.3)=1;
%evaluation
sensitivity=length(intersect(find(x),find(x0)))/length(find(x0));    %reconstruct rate
fp=1-length(intersect(find(x),find(x0)))/length(find(x)); %false positive
re=norm(A*x-A*x0,2)/norm(A*x0,2);   %relative error 等式约束二范数的相对误差

count=count+1;
b(count)=sensitivity;
c(count)=fp;

end

%hold on;
%plot(x,'r.-')  %重建信号
%plot(x0,'b') % 原始信号
%legend('Recovery','Original')

plot(a,b,'b',a,c,'red')
legend('重建率','假阳性率')