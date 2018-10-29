#/usr/bin/python
##description of the algorithm: divide, conquer , merge

from string import atoi
a=raw_input("please enter unsorted numbers(seperated by space)")

a=map(atoi,a.strip("\n").split())

#a=[-5,2,4,6,7,1]   #test numbers to be sorted 

def f_merge(a,b):
    i=0
    j=0
    c=[]
    while i<len(a) and j<len(b):
        if a[i]<b[j]:
            c.append(a[i])
            i=i+1
        else :
            c.append(b[j])
            j=j+1
    if i>=len(a):
        c=c+b[j:]
    if j>=len(b):
        c=c+a[i:]
    return c
    
def merge_sort(a):
    if len(a)<=1:
        return a
    else:
        b=merge_sort(a[:int( (len(a)/2)  )])
        c=merge_sort(a[(int( (len(a)/2)  )+1):])   #recursion
        return f_merge(b,c)
    
