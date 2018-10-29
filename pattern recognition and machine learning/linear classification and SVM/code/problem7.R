#call R package 'e1071', providing interface of libSVM

setwd('E:/课程/2017年春/模式识别/hw/hw4/handin')
library('e1071')

#sample
mydata=matrix(c(-3,-2.9,0.5,8.7,2.9,2.1,-0.1,5.2,-4,2.2,-1.3,3.7,-3.4,6.2,-4.1,3.4,-5.1,1.6,1.9,5.1,-2,-8.4,-8.9,0.2,-4.2,-7.7,-8.5,-3.2,-6.7,-4,-0.5,-9.2,-5.3,-6.7,-8.7,-6.4,-7.1,-9.7,-8.0,-6.3),nrow=20,ncol=2,byrow=T);
mydata=as.data.frame(mydata)
mydata$label=c(rep(1,10),rep(2,10));
mydata$color[mydata$label==1]="blue"
mydata$color[mydata$label==2]="red"
colnames(mydata)<-c('x1','x2','label','color')
plot(mydata[,c(1,2)],col=mydata$color)
legend('topleft',c('w1','w2'),pch=c(1,1),col=c('blue','red')  )

#transform into higher space
hdata=matrix(1,20,7)   #1
hdata[,2]=mydata[,1]   #x1
hdata[,3]=mydata[,2]   #x2
hdata[,4]=mydata[,1]*mydata[,1]   #x1^2
hdata[,5]=mydata[,1]*mydata[,2]   #x1*x2
hdata[,6]=mydata[,2]*mydata[,2]   #x2*x2
hdata[,7]=mydata$label   #label
colnames(hdata)<-c('1','x1','x2','x1^2','x1*x2','x2^2','label')


#train
w0=matrix(1,10,6)
rho=matrix(1,10,1)
margin=matrix(1,10,1)

i=1
while (i<=10)
{
  myset=hdata[c(1:i,11:(i+10)),]
  svm.model = svm(label ~ ., data=myset, type='C-classification', kernel='linear')
  svm.pred <- predict(svm.model, myset[,-7])
  w0[i,]=t(svm.model$coefs)%*%(svm.model$SV)
  rho[i]=svm.model$rho
  margin[i]=2/sqrt(sum(w0[i,]*w0[i,]))
  i=i+1
  
  #table(svm.pred,hdata[c(1:i,11:(i+10)),7])
}
