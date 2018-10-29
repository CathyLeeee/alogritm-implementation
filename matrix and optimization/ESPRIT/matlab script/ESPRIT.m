%�㷨Ҫ��ʱ��m>p����ʵ�ʲ�����p����δ֪������ȡʱ��mΪ������
function[mse]=ESPRIT(N,sigma_s)
X=produce_input(N,1); %input N*200

I=diag((zeros(N-1,1)+1),0);
Z=diag((zeros(N-2,1)+1),-1);
%omega=[0.72*pi,0.37*pi,0.12*pi]';
omega=[0.12*pi,0.37*pi,0.72*pi]';

K=200;
MSE=zeros(K,1); %initialization
%rxx
for k=1:K
    rxx=X(1:(N-1),k)*X(1:(N-1),k)';  %rxx ����ʱ��ȡΪ��������rxx������Ϊ�䱾��
    rxy=X(2:N,k)*X(2:N,k)';%rxy ����ʱ��ȡΪ��������rxy������Ϊ�䱾��
    lamda_min=min(eig(rxx));
    %cxx & cxy
    cxx=rxx-lamda_min*I;
    cxy=rxy-lamda_min*Z;
    omega_hat=eig(cxx,cxy);
    omega_hat=imag(log(omega_hat));
    
    %method1
    %omega_hat=sort(omega_hat);
    %a=omega_hat(1);
    %b=omega_hat(2);
    %c=omega_hat(3);
    
    %method2
    aa=abs(omega_hat-0.12*pi );
    a=omega_hat(find(aa==min(aa)));
    bb=abs(omega_hat-0.37*pi );
    b=omega_hat(find(bb==min(bb)));
    cc=abs(omega_hat-0.72*pi );
    c=omega_hat(find(cc==min(cc)));
   
   
    mse= (omega(1)-a)^2 +(omega(2)-b)^2+(omega(3)-c)^2 ;
    MSE(k)=mse;
end
mse=sum(MSE)/length(MSE);

end

