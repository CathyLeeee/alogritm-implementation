A=rand(11,8)

H=eye(11);
for i=1:8
    x=A(i:11,i:i);
    z=[1,repmat(0,1,11-i)]';
    A=[eye(i-1) zeros(i-1,12-i);zeros(12-i,i-1)   Householder(x,z)   ]*A;
    H=[eye(i-1) zeros(i-1,12-i);zeros(12-i,i-1)   Householder(x,z)   ]*H;
end
    
Q=H'
R=A 
