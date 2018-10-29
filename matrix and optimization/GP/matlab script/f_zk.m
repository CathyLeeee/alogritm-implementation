function[z_l]=f_zk(z,alpha,B,c,rou,miu)

z_l=f_plus(z-alpha*f_delta(B,c,z));
while f_delta(B,c,z_l)> (f_delta(B,c,z)- miu*((f_delta(B,c,z))')*(z_l-z))
    alpha=rou*alpha;
    %z=z_l;
    z_l=f_plus(z-alpha*f_delta(B,c,z));
end
    
