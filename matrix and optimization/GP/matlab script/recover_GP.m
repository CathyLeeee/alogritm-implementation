nnn=30%������� 
a=1:nnn;
b=zeros(nnn,1);
c=zeros(nnn,1);
count=1
while count<nnn

%��ʼ���㷨�����Ͳ�������A�������ź�r

z=rand(512,1); %�㷨����z

lamda=0.002;    %�㷨������lamdaȡֵԽ��õ��Ľ�Խϡ��
rou=0.5; %�㷨������Armijo�����ص����ӣ�ȡֵ�ڣ�0,1���䣬���СӰ�첽���µ��ٶ�
alpha=0.05;  %�㷨������Armijo��������ʽ��ϵ��,Ӱ��Armijo����
A=normrnd(0,1/160,[160,256]);   % ��������A��160*256�����������Ԫ�ط�����̬�ֲ�N��0,1/160��
K=10; %ϡ���
p=K/256;  %��ϡ��Ⱦ�������ֲ�����
x0=binornd(1,p,256,1);  %����ԭ�ź�x0,256*1,��ÿ��Ԫ�ط��Ӷ���ֲ� 
r=A*x0;% ������Բ���
%r=A*x0+normrnd(0,0.01,[160,1]);  %noise ~N(0,1)
%r=r-normrnd(0,0.01,[160,1]);   %denosie balance

%GP�㷨����ֹͣ������С����Χ���ߴﵽ�涨��������
e=0.01;  %�������̶�,GP�㷨��������
n=20000;   %GP�㷨��������

[x]=f_iteration(z,rou,alpha,A,r,n,e,lamda);
x(abs(x)<0.3)=0;
x(abs(x)>=0.3)=1;
%evaluation
sensitivity=length(intersect(find(x),find(x0)))/length(find(x0));    %reconstruct rate
fp=1-length(intersect(find(x),find(x0)))/length(find(x)); %false positive
re=norm(A*x-A*x0,2)/norm(A*x0,2);   %relative error ��ʽԼ����������������

count=count+1;
b(count)=sensitivity;
c(count)=fp;

end

%hold on;
%plot(x,'r.-')  %�ؽ��ź�
%plot(x0,'b') % ԭʼ�ź�
%legend('Recovery','Original')

plot(a,b,'b',a,c,'red')
legend('�ؽ���','��������')