%initialization

%z=rand(2000,1); 
%z_0=z;
z=z_0;
lamda=1;    %weight factor; with greater lamda
rou=0.5;
miu=0.1;
A=normrnd(0,1,[200,1000]);  

%x0=normrnd(0,5,[1000,1]);  %initialization of x0
%zero_int=randperm(1000*1);
%x0(zero_int(1:900))=0;

y=A*x0;
b=A'*y;
c=lamda+zeros(2000,1)+[-b;b];
B=[A'*A, -A'*A; -A'*A,A'*A];

e=0.01  %user-defined error

%step1 figure out the value of alpha
alpha=f_alpha(z,B,c);    
%step2 figure out z
z_b=z;
z=f_zk(z,alpha,B,c,rou,miu);

k=0;
while    (norm(min(f_delta(B,c,z),z))>e && k<=500)%&& norm(z-z_b)>e  )   
    
    %step1 figure out the value of alpha
    alpha=f_alpha(z,B,c);
    
    %step2 figure out z
    z_b=z;
    z=f_zk(z,alpha,B,c,rou,miu);
    k=k+1;
end

%recover x from z
x=z(1:1000)-z(1001:2000);

%evaluation of performance
k
sparsity=1000-length(find(x))
ms=norm(y-A*x)





