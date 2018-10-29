    function p=Parzen(x,h,N)  
    %% ·½´°  parzen ´°     
    f = x(1:1000);  
    f=sort(f);  
    b=0;  
      
    for i=1:1000  
        for j=1:N  
            if abs((x(j)-f(i))/h) <= 1/2   %·½´°  
                q=1;  
            else  
                q=0;  
            end  
            b= q+ b;  
        end  
        a(i)=b;  
        b=0;  
    end  
      
    for i=1:1000  
        p(i) = 1/(N*h)*a(i);  
    end  
    end  