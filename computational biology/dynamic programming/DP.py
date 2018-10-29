#!usr/bin/python

#readin
f=open(r"/data/home/ysli/algorithm_hw/exercise3.txt","r")
txt=f.read()
f.close()

str1=txt.split("\n")[0][0:10000]
str2=txt.split("\n")[2][0:10000]

#dynamic programming
def lcs(str1,str2):
    score=[[0 for x in range(len(str2)+1)] for y in range(len(str1)+1)]   #score matrix 
    d=[['ok' for x in range(len(str2)+1)] for y in range(len(str1)+1)]    #direction matrix
    
    for p1 in range(len(str1)):
        for p2 in range(len(str2)):
            if str1[p1]==str2[p2]:    #match
                score[p1+1][p2+1]=score[p1][p2]+1
                d[p1+1][p2+1]='ok'
            elif score[p1+1][p2]>score[p1][p2+1]:  #left score is better
                score[p1+1][p2+1]=score[p1+1][p2]
                d[p1+1][p2+1]='left'
            else:
                score[p1+1][p2+1]=score[p1][p2+1]    #up score is better
                d[p1+1][p2+1]='up'
    strm=[]
    (p1,p2)=(len(str1),len(str2))
    while score[p1][p2]:
        c=d[p1][p2]
        if c=='ok':
            strm.append(str1[p1-1])
            p1=p1-1
            p2=p2-1
        if c=='left':
            p2=p2-1
        if c=='up':
            p1=p1-1
    strm.reverse()
    return "".join(strm)


#output
strm=lcs(str1,str2)
f=open(r"/data/home/ysli/algorithm_hw/hw3_result.txt","w")
f.write(strm)
f.close()








            
    






    
