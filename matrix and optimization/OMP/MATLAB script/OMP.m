nnn=30%������� 
a=1:nnn;
b=zeros(nnn,1);
c=zeros(nnn,1);
count=1
while count<nnn
    
% ѹ������(����ƥ��׷�ٷ�Orthogonal Matching Pursuit)
% ��������A��160*256�����������Ԫ�ط�����̬�ֲ�N��0,1/160��
% ������M=160�������źż�Ϊr

%% 1. ����ԭ�ź�
K=10; %ϡ���
p=K/256; %��ϡ��Ⱦ�������ֲ�����
x0=binornd(1,p,256,1);  %����ԭ�ź�x0,256*1,��ÿ��Ԫ�ط��Ӷ���ֲ� 
N=256; % �źų���
M=160; % ������Ӧ����M>=K*log(N/K)

%% 2. ��������ѹ��ԭ�źŵõ������ź�r
A=normrnd(0,1/160,[160,256]);   % ��������A��160*256�����������Ԫ�ط�����̬�ֲ�N��0,1/160��
A=A*diag(1./sqrt(sum(A.*A))); %��A��ÿһ�л�Ϊ��λ����,ʹ��A��ÿһ����r���ڻ���Ϊr�ڸ������ϵ�ͶӰ����
r=A*x0; % ������Բ���
%r=A*x0+normrnd(0,0.01,[160,1]);  %noise ~N(0,01)
%r=r-normrnd(0,0.01,[160,1]);   %denosie balance

%% 3. ����ƥ��׷�ٷ��ع��ź�(��������L_1�������Ż�����)

m=K; % �㷨��������(m>=K)
x=zeros(N,1); % ���ع�������
M_index=[]; % ��ʼ����������(��ʼֵΪ�վ���)
r_n=r; % �в�ֵ
for times=1:m; % ��������(�������������,�õ�������ΪK)
for col=1:N; % �ָ����������������
product(col)=abs(A(:,col)'*r_n); % �ָ�������������Ͳв��ͶӰϵ��(�ڻ�ֵ)
end
[val,pos]=max(product); % ���ͶӰϵ����Ӧ��λ��
M_index=[M_index,A(:,pos)]; % ��������
A(:,pos)=zeros(M,1); % ѡ�е������㣨ʵ����Ӧ��ȥ����������������㣩
value_x=(M_index'*M_index)^(-1)*M_index'*r; % ��С����,ʹ�в���С
r_n=r-M_index*value_x; % �в�
pos_array(times)=pos; % ��¼���ͶӰϵ����λ��
end

x(pos_array)=value_x; % �ع�����
x(abs(x)<0.3)=0;
x(abs(x)>=0.3)=1;



%evaluation
sensitivity=length(intersect(find(x),find(x0)))/length(find(x0));    %reconstruct rate
fp=1-length(intersect(find(x),find(x0)))/length(find(x)); %false positive
re=norm(A*x-A*x0,2)/norm(A*x0,2);   %relative error ��ʽԼ����������������

count=count+1;
b(count)=sensitivity;
c(count)=fp;
d(count)=re;
end

%% 4. �ָ��źź�ԭʼ�źŶԱ�

hold on;
%plot(x,'r.-')  %�ؽ��ź�
%plot(x0,'b') % ԭʼ�ź�
%legend('Recovery','Original')

plot(a,b,'b',a,c,'red')
legend('�ؽ���','��������')

