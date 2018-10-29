function[alpha]=f_alpha(z,B,c)
deltaF=f_delta(B,c,z);
g=zeros(length(z),1);
for i=1:length(z)
    if z(i)>0 || deltaF(i)<0
        g(i)=deltaF(i);
    end
end
alpha=g'*g/(g'*B*g);
        
    