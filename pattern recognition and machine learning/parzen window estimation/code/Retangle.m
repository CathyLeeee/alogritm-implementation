    function p=Retangle(x,h)  
    %  parzen window ·½´° 
    %  x -sampling data  
    %  h - window width       
    N=length(x);
  
    b=0;  
      
    for i=1:N 
        for j=1:N  
            if abs((x(j)-x(i))/h) <= 1/2   
                b=b+1;
            end  
        end  
        a(i)=b;  
        b=0;  
    end
    
    
    p=(1/(N*h))*a; 
    end  