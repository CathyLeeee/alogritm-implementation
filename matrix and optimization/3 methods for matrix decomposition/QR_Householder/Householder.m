

function H=Householder(x,z)
% H is the output householder matrix
% x is the vector to be transformed
% z is the unit vector showing the transformation direction
    I=eye(size(x*x'));
    d=sqrt(sum(x.^2));
    if x-d*z==0
        H=I;
    else
        u=(x-d*z)/sqrt(sum((x-d*z).^2));
        H=I-2*u*u' ;
    end


