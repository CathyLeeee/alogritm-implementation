#/usr/bin/python
##description of the algorithm: swamp the adjacent number if unordered in the unsorted numbers during every cycle

from string import atoi
a=raw_input("please enter unsorted numbers(seperated by space)")

a=map(atoi,a.strip("\n").split())

#a=[-5,2,4,6,7,1]   #test numbers to be sorted 

for j in range(len(a)):
    for i in range(len(a)-j-1):
        if a[i]>=a[i+1]:
            temp=a[i]    #intermediate variable for storing the value of a[i]
            a[i]=a[i+1]
            a[i+1]=temp
print a
