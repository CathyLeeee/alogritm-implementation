nnn=30%仿真次数 
a=1:nnn;
b=zeros(nnn,1);
c=zeros(nnn,1);
count=1
while count<nnn
    
% 压缩传感(正交匹配追踪法Orthogonal Matching Pursuit)
% 测量矩阵A是160*256的随机矩阵，其元素服从正态分布N（0,1/160）
% 测量数M=160，测量信号记为r

%% 1. 生成原信号
K=10; %稀疏度
p=K/256; %由稀疏度决定二项分布概率
x0=binornd(1,p,256,1);  %产生原信号x0,256*1,其每个元素服从二项分布 
N=256; % 信号长度
M=160; % 测量数应满足M>=K*log(N/K)

%% 2. 测量矩阵压缩原信号得到测量信号r
A=normrnd(0,1/160,[160,256]);   % 测量矩阵A是160*256的随机矩阵，其元素服从正态分布N（0,1/160）
A=A*diag(1./sqrt(sum(A.*A))); %将A的每一列化为单位向量,使得A中每一列与r的内积即为r在该向量上的投影长度
r=A*x0; % 获得线性测量
%r=A*x0+normrnd(0,0.01,[160,1]);  %noise ~N(0,01)
%r=r-normrnd(0,0.01,[160,1]);   %denosie balance

%% 3. 正交匹配追踪法重构信号(本质上是L_1范数最优化问题)

m=K; % 算法迭代次数(m>=K)
x=zeros(N,1); % 待重构的向量
M_index=[]; % 初始化索引矩阵(初始值为空矩阵)
r_n=r; % 残差值
for times=1:m; % 迭代次数(有噪声的情况下,该迭代次数为K)
for col=1:N; % 恢复矩阵的所有列向量
product(col)=abs(A(:,col)'*r_n); % 恢复矩阵的列向量和残差的投影系数(内积值)
end
[val,pos]=max(product); % 最大投影系数对应的位置
M_index=[M_index,A(:,pos)]; % 矩阵扩充
A(:,pos)=zeros(M,1); % 选中的列置零（实质上应该去掉，简单起见将其置零）
value_x=(M_index'*M_index)^(-1)*M_index'*r; % 最小二乘,使残差最小
r_n=r-M_index*value_x; % 残差
pos_array(times)=pos; % 纪录最大投影系数的位置
end

x(pos_array)=value_x; % 重构向量
x(abs(x)<0.3)=0;
x(abs(x)>=0.3)=1;



%evaluation
sensitivity=length(intersect(find(x),find(x0)))/length(find(x0));    %reconstruct rate
fp=1-length(intersect(find(x),find(x0)))/length(find(x)); %false positive
re=norm(A*x-A*x0,2)/norm(A*x0,2);   %relative error 等式约束二范数的相对误差

count=count+1;
b(count)=sensitivity;
c(count)=fp;
d(count)=re;
end

%% 4. 恢复信号和原始信号对比

hold on;
%plot(x,'r.-')  %重建信号
%plot(x0,'b') % 原始信号
%legend('Recovery','Original')

plot(a,b,'b',a,c,'red')
legend('重建率','假阳性率')

