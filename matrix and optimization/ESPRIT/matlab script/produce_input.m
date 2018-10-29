function[X]=produce_input(N,sigma_s)  %X is the matrix of 200 experiments
s=[1.31*exp(i*pi/4),2.07*exp(i*pi/3),1.88*exp(i*pi/5)];
x_1=zeros(N,1);%vector of length N(observation for 1 experiment)
K=200; %repeat times of experiment
X=zeros(N,K);
for k=1:K
    for n=1:N
        omega=[exp(i*0.12*pi*n),exp(i*0.37*pi*n),exp(i*0.72*pi*n)]';
        w=normrnd(0,sigma_s);
        x_1(n)=s*omega+w;
    end
    X(:,k)=x_1;
end
 
