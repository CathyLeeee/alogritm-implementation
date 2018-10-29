function[x]=newtown(miu,sigmas,A,r,k,n)
x=zeros(256,1)+0.5;  %initialization starting from x=0.5

delta2psi=zeros(256,256);
deltapsi=zeros(256,1);
lamda=zeros(256,1);
b_deltafx=0;
b_x=0;
it=0 ; %牛顿法迭代次数
while it<n
    for j=1:256
        delta2psi(j,j)=(x(j)^2+(1-x(j))^2)/(x(j)^2*(1-x(j))^2);
        deltapsi(j)=(2*x(j)-1)/(x(j)*(1-x(j)));
        lamda(j)=log((1-x(j))/x(j));
    end
    delta2l=(1/sigmas)*A'*A;
    deltal=lamda+(1/sigmas)*A'*(A*x-r);
    hk=delta2l+k*delta2psi;
    deltafx=deltal+k*deltapsi;
    rouk=deltafx-b_deltafx;
    deltak=x-b_x;
    betak=1+dot(rouk,deltak)/dot(hk*rouk,rouk);
    deltahk=(hk*rouk*deltak'+deltak*rouk'*hk)/dot(hk*rouk,rouk)-betak*(hk*rouk*rouk'*hk)/dot(hk*rouk,rouk);
  
    x=x-deltahk*deltafx;
  
    it=it+1;
    b_deltafx=deltafx;
    b_x=x;
end

end