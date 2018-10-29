 clear;clc  
    %  parzen ·½´°      
    
   x=[normrnd(-1,1,1,2000),normrnd(1,1,1,8000)];    %sampling 10000*1  (0.2N(-1,1)+0.8N(1,1))
   x=sort(x);
   px=func_px(x);
   
   h=[0.25,0.5,1,2,5,10];
   for i=1:6
       p(:,i)=Retangle(x,h(i));
       
   end
% retangle window  ; N=10000 
   subplot(331)
   plot(x,p(:,1))
   title('N=10000 h=0.25')
   subplot(332)
   plot(x,p(:,2))
   title('N=10000 h=0.5')
   subplot(333)
   plot(x,p(:,3))
   title('N=10000 h=1')
   subplot(334)
   plot(x,p(:,4))
   title('N=10000 h=2')  
   subplot(335)
   plot(x,p(:,5))
   title('N=10000 h=5')  
   subplot(336)
   plot(x,p(:,6))
   title('N=10000 h=10')  
   subplot(338)
   plot(x,px)
   title('px')  
   
   
   
  