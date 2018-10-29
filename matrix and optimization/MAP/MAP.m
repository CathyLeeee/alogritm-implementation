nnn=20%仿真次数 
a=1:nnn;
b=zeros(nnn,1);
c=zeros(nnn,1);
count=1
while count<nnn

%initialization
k=0.002;    %penalty weight factor
miu=0.05;   %step legth of newtown

A=normrnd(0,1/160,[160,256]);  
x0=binornd(1,0.1,256,1);  %with the fault probability of p=0.001
r=A*x0+normrnd(0,0.01,[160,1]);  %noise ~N(0,0.01) 
sigmas=0.01;%denosie balance

%e=0.01;  %牛顿法循环条件 
n=20000;   %iteration times for newtown

[x]=newtown(miu,sigmas,A,r,k,n);

%cutoff
theta=0.01;
for i=1:length(x)
    if x(i)>theta
        x(i)=1
    else
        x(i)=0
    end
end
    

%evaluation
sensitivity=length(intersect(find(x),find(x0)))/length(find(x0));    %reconstruct rate
fp=1-length(intersect(find(x),find(x0)))/length(find(x)); %false positive
rd=norm(A*x-A*x0,2)/norm(A*x0,2);   %relative distance

count=count+1;
b(count)=sensitivity;
c(count)=fp;

end

plot(a,b,'b',a,c,'red')
legend('sensitivity','false positive')