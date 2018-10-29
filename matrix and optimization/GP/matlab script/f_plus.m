function[a]=f_plus(a)
for i=1:length(a)
    if a(i)<0
        a(i)=0;
    end
end
        