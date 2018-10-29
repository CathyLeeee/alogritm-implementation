#/usr/bin/python
##description of the algorithm: select the minimun number from unsorted numbers in every cycle

from string import atoi
a=raw_input("please enter unsorted numbers(seperated by space)")

a=map(atoi,a.strip("\n").split())

#a=[-5,2,4,6,7,1]   #test numbers to be sorted 


for i in range(len(a)):
    my_min=min(a[i:len(a)])  #store the index of the min in case of temporary the same minimum value in the array
    my_index=a.index(my_min)
    temp=a[i]#temporay variable for storing the value of a[i](the first element of the unsorted numbers)
    a[i]=my_min
    print a[i]
    a[my_index]=temp
    
    

print a
