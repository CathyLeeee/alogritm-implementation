
A=rand(11,8)

G=eye(11);   %the final Givens matrix for A
for    i=1:8  %i=1:8  
    G_I=eye(12-i);     % G for every colum(i) vector
    for j=i+1:11
        if j==i+1
            a=A(i,i)/sqrt(sum(A(i:j,i).^2));   %cos
            b=A(j,i)/sqrt(sum(A(i:j,i).^2));  %sin
        else    
            a=sqrt(sum(A(i:j-1,i).^2))/sqrt(sum(A(i:j,i).^2));   %cos
            b=A(j,i)/sqrt(sum(A(i:j,i).^2));  %sin
        end
        temp=eye(12-i);     %temp is  a matrix for storing evey sub element of G_c
        temp(1,:)=[a repmat(0,1,(j-i-1)) b repmat(0,1,(11-j))] ; 
        temp(j+1-i,:)=[-b repmat(0,1,(j-i-1)) a  repmat(0,1,(11-j))]  ; 
        G_I=temp*G_I; 
    end
A=[eye(i-1), zeros(i-1,12-i);zeros(12-i,i-1), G_I]*A;  %the final iteration result of A is R
G=[eye(i-1), zeros(i-1,12-i);zeros(12-i,i-1), G_I]*G;
end

Q=G'
R=A   

