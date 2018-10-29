#!usr/bin/python

#readin
f=open(r"/data/home/ysli/algorithm_hw/exercise4.txt","r")
txt=f.readlines()
f.close()

for i in range(len(txt)):
    txt[i]=txt[i].strip("\r\n")

dn127="".join(txt[1:23])
pko="".join(txt[25:47])
b31="".join(txt[49:78])

#dynamic programming
def global_alignment(str1,str2,str3):
    score=[[[0 for z in range(len(str3)+1)] for y in range(len(str2)+1)] for x in range(len(str1)+1)]   #score matrix
    d=[[['ok' for z in range(len(str3)+1)] for y in range(len(str2)+1)] for x in range(len(str1)+1)]   #direction matrix
 
    for p1 in range(len(str1)):
        for p2 in range(len(str2)):
            for p3 in range(len(str3)):
                if (str1[p1]==str2[p2]) & (str2[p2]==str3[p3]):     #no indel
                    score[p1+1][p2+1][p3+1]=score[p1][p2][p3]+2
                    d[p1+1][p2+1][p3+1]="ok"
                elif (str2[p2]==str3[p3]) & (str1[p1]!=str2[p2]) :   #1 indel in str1
                    score[p1+1][p2+1][p3+1]=score[p1+1][p2][p3]+1
                    d[p1+1][p2+1][p3+1]="s1"
                elif (str1[p1]==str3[p3]) & (str1[p1]!=str2[p2]):   #1 indel in str2
                    score[p1+1][p2+1][p3+1]=score[p1][p2+1][p3]+1
                    d[p1+1][p2+1][p3+1]="s2"
                elif (str1[p1]==str2[p2]) & (str2[p2]!=str3[p3]):   #1 indel in str3
                    score[p1+1][p2+1][p3+1]=score[p1][p2][p3+1]+1
                    d[p1+1][p2+1][p3+1]="s3"
                else:                                               #2 indels
                    score[p1+1][p2+1][p3+1]=max(score[p1][p2+1][p3+1],score[p1+1][p2][p3+1],score[p1+1][p2+1][p3])
                    d[p1+1][p2+1][p3+1]="three"

           
    strm1=[]
    strm2=[]
    strm3=[]
    (p1,p2,p3)=(len(str1),len(str2),len(str3))
    while score[p1][p2][p3]:
        c=d[p1][p2][p3]
        if c=='ok':
            strm1.append(str1[p1-1])
            strm2.append(str1[p1-1])
            strm3.append(str1[p1-1])
            p1=p1-1
            p2=p2-1
            p3=p3-1
        if c=='s1':
            strm1.append("-")
            p1=p1-1
        if c=='s2':
            strm2.append("-")
            p2=p2-1
        if c=='s3':
            strm3.append("-")
            p3=p3-1
        if c=='three':
            strm1.append("-")
            strm2.append("-")
            strm3.append("-")
            p1=p1-1
            p2=p2-1
            p3=p3-1
            
    strm1.reverse()
    strm2.reverse()
    strm3.reverse()
    return "\n".join(["".join(strm1),"".join(strm2),"".join(strm3)])


#output
strm=global_alignment(dn127,pko,b31)
f=open(r"/data/home/ysli/algorithm_hw/hw4_result.txt","w")
f.write(strm)
f.close()






            
    






    
