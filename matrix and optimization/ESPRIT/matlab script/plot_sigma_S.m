[mse]=ESPRIT(100,1)

%plot the change of MSE according to sigma_s
sigma_s=[0 0.01 0.1 0.5 1 2 5 10]';
MSE=zeros(length(sigma_s),1);
for n=1:length(sigma_s)
    MSE(n)=ESPRIT(100,sigma_s(n));
end

plot(sigma_s,MSE)
