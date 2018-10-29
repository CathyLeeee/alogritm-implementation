function[x]=steepest(miu,sigmas,A,r,k,n)
x=zeros(256,1)+0.5;  %initialization starting from x=0.5
deltapsi=zeros(256,1);
lamda=zeros(256,1);
b_deltafx=0;
b_x=0;
it=0 ; %牛顿法迭代次数
while it<n
    for j=1:256
        deltapsi(j)=(2*x(j)-1)/(x(j)*(1-x(j)));
        lamda(j)=log((1-x(j))/x(j));
    end
    deltal=lamda+(1/sigmas)*A'*(A*x-r);
    deltafx=deltal+k*deltapsi;
    
    
    while 
  
    x=x-alphak*deltafx;
  
    it=it+1;
    b__deltafx=deltafx;
    b_x=x;
end

end