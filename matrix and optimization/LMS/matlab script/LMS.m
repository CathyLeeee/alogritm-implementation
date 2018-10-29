%tf=0.05;
miu=0.001;
k=1000;

[a0,a1,w_a]=f_lms(miu,k);

i_t=1:k;
plot(i_t,w_a(1,:),'blue',i_t,w_a(2,:),'red');
legend('a0','a1');
xlabel('iteration times');
a0
a1


%[a0,a1,x,y,z]=f_lms(tf,k);

%plot(x,y,'b',x,z,'red');
%legend('a0','a1');
%xlabel('k');
 