#/usr/bin/python
##description of the algorithm: diminish increment; the key is choosing the gap value;the subarrays shell sort operates on are initially short and longer latered when they are alomost sorted, in which case insertion sort is quite efficient

from string import atoi
a=raw_input("please enter unsorted numbers(seperated by space)")

a=map(atoi,a.strip("\n").split())

#a=[-5,2,4,6,7,1]   #test numbers to be sorted

gap1=3
gap2=1

def insertion_sort(a):
    if len(a)==2:
        a=[min(a),max(a)]
    else:  
        for i in range(1,len(a)):
            for j in range(i-1):
                if a[i]>a[j] and a[i]<a[j+1]:
                    temp=a[i]    #temporarily store the value of a[i]
                    a.pop(a.index(a[i]))
                    a.insert((j+1),temp)
                    break
    return a
    
#3-sorting(gap/increment=3)
for i in range(gap1):
    a[i:len(a):gap1]=insertion_sort(a[i:len(a):gap1])
print a

#1-sorting(gap/increment=1)
for i in range(gap2):
    a[i:len(a):gap2]=insertion_sort(a[i:len(a):gap2])
print a


