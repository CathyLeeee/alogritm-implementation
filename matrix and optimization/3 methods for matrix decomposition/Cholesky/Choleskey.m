X=rand(11,8)
A=X'*X   


for i=1:8
    %factorization
    a11=sqrt(A(i,i));
    A21=A(i+1:8,i)/a11;
    %iteration: replace the value in the original matrix with factorization
    %result without extra space expense
    A(i,i)=a11;
    A(i+1:8,i)=A21;
    if i ~= 8
        A(i+1:8,i+1:8)=A(i+1:8,i+1:8)-A21*A21';   %the lower triangle part of A is the value of L
    end
    
end 

L=A;
for i =1:8
    L(i,i+1:8)=0;
end

L


