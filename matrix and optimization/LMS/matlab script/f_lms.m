function [a0,a1,w_a]=f_lms(miu,k)
%tf is the trimmed factor, adjusting step value
%k is the user-chosen number for times of iteration 

%step1 initionalization

w=zeros(2,1);

u_a=zeros(2,k);
r_a=zeros(1,k);
u=normrnd(0,1,[2,1]);   %N(0,1)
for i=1:k
    u_b=u;
    u=[normrnd(0,1,[1,1]),u_b(1)]';
    u_a(:,i)=u;
    r_a(:,i)=[0.7 -0.2]*u+normrnd(0,0.05,[1,1]);
end


%step2 iteration
w_a=zeros(2,k);
for i=1:k
    e=r_a(:,i)-w'*u_a(:,i);
    w=w+miu*e*u_a(:,i);
    w_a(:,i)=w;
end
    
    a0=w(1,:);
    a1=w(2,:);
    
   
end


