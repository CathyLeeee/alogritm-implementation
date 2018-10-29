setwd("E:/courses/统计学方法与应用/作业/7th_大作业/")

N=150   #number 
L=40    #length


mysequence<-1:N
for (i in 1:N){
  temp<-sample(c("A","T","C","G"),size=L,replace=T)
  mysequence[i]<-paste(temp,collapse="")
}
cat(mysequence, file = "mysequence.txt", sep = "\n")
 