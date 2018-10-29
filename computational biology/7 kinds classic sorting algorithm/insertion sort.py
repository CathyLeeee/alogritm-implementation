#/usr/bin/python
##description of the algorithm:insert a number in the proper position every cycle.

from string import atoi
a=raw_input("please enter unsorted numbers(seperated by space)")

a=map(atoi,a.strip("\n").split())

#a=[-5,2,4,6,7,1]   #test numbers to be sorted 

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


print a
    

