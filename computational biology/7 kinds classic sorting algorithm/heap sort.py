#/usr/bin/python
##description of the algorithm: based on data structure "heap"

from string import atoi
a=raw_input("please enter unsorted numbers(seperated by space)")

a=map(atoi,a.strip("\n").split())

#a=[-5,2,4,6,7,1]   #test numbers to be sorted

from heapq import heappush, heappop

def heapsort(x):
    h=[]                #build empty heap
    for i in x:
        heappush(h,i)    #push items of unsorted x on heap
    return [heappop(h) for i in range(len(h))]   

print heapsort(a)
