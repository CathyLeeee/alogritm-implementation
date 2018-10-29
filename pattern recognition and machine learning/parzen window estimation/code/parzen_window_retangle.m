    clear;clc  
    %  parzen ·½´°     
    N=[10,50,100,1000,2000];  %sample number
    h=[0.25,0.5,1,2,5,10];  %window width 
    expectation=zeros(5,6);
    variance=zeros(5,6);
    for j=1:5
        error=zeros(50,6);
        for i=1:6
            for m=1:50   %sampling times
                p=zeros(N(j),6);
                x=[normrnd(-1,1,1,0.2*N(j)),normrnd(1,1,1,0.8*N(j))];    %sampling 10000*1  (0.2N(-1,1)+0.8N(1,1))
                x=sort(x);
                px=func_px(x);
                
                p(:,i)=(Retangle(x,h(i)))';
                error(m,i)=sum((p(:,1)-px').^2);
           
            end
        end
        expectation(j,:)=mean(error);
        variance(j,:)=var(error);
    end
  