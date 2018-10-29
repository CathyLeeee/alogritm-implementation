%plot the change of MSE according to sigma_s
N=[10 20 30 40 50 60 70 80 90 100 200 500 ]';
MSE=zeros(length(N),1);
for n=1:length(N)
    MSE(n)=ESPRIT(N(n),1);
end

plot(N,MSE)
