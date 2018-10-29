#/usr/bin/python
##description of the algorithm: select  a ref-umber in each cycle,dividing  numbers into 2 clubs, either greater than ref or less than ref

from string import atoi
a=raw_input("please enter unsorted numbers(seperated by space)")

a=map(atoi,a.strip("\n").split())

#a=[-5,2,4,6,7,1]   #test numbers to be sorted 


    


def q_sort(x):
    if len(x)<=1:
        return x
    else:
        ref=x.pop(len(x)-1)
        a=[]
        b=[]
        for i in  x:
            if i>=ref:
                b.append(i)
            else:
                a.append(i)
        return q_sort(a)+[ref]+q_sort(b)
        
    
print q_sort(a)                 
