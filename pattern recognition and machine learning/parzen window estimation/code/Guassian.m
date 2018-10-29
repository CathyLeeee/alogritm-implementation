    function  p =  Guassian(x,h)  
    %  parzen window ¸ßË¹´° 
    %  x -sampling data  
    %  h - window width  
    
    N=length(x);
   
    b=0;  
    h1 =  h/sqrt(N);  
    for i=1:N  
        for j=1:N  
        b= b+ exp(((x(j)-x(i))/h1).^2/(-2))/sqrt(2*pi)/h1;  %N(x(i),h1^2)
        end  
        p(i) =  b/N;  
        b=0;  
    end  
    end  