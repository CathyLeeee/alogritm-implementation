

function[sparsity,d]=f_iteration(z,rou,miu,A,x0,n,e,lamda)

y=A*x0;
b=A'*y;
c=lamda+zeros(2000,1)+[-b;b];
B=[A'*A, -A'*A; -A'*A,A'*A];


%step1 figure out the value of alpha
alpha=f_alpha(z,B,c);    
%step2 figure out z
z_b=z;
z=f_zk(z,alpha,B,c,rou,miu);

k=0;
while    (norm(min(f_delta(B,c,z),z))>e && k<=n)%&& norm(z-z_b)>e  )   
    
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
sparsity=1000-length(find(x));
d=norm(y-A*x);





