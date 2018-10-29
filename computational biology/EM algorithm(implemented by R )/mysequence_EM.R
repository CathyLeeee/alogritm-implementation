setwd("E:/courses/统计学方法与应用/作业/7th_大作业/")
######base matrix readin and numeralization
mydata<-read.table("mysequence.txt")  #base matrix
L=nchar(as.character(mydata[1,]))  #L as the sequence length
N=nrow(mydata) #N as the number of sequence
x<-matrix(0,nrow=N,ncol=L) #initailization of numeric matrix as the same dim with base matrix

fun.btn<-function(text){             #base to numeric
  text<-gsub(pattern = "A", replacement = "1,", text) 
  text<-gsub(pattern = "T", replacement = "2,", text) 
  text<-gsub(pattern = "C", replacement = "3,", text) 
  text<-gsub(pattern = "G", replacement = "4,", text) 
  
  text<-as.numeric(unlist(strsplit(text,split=",")))
  return(text)
}

for (i in 1:nrow(mydata)){
  x[i,]<-fun.btn(mydata[i,])
}    #x as the numeric matrix of the original sequence

########parameter initialization
K=8  #K as the motif length

theta_0<-c(0.1,0.4,0.2,0.3)      # theta_0 as the probability of base occurence in background region
theta_big<-matrix(0.25,nrow=4,ncol=K)     # theta_big as the probability of base occurence in foreground region
lamda<-matrix(1/(L-K+1),nrow=1,ncol=(L-K+1))   #lamda as the probability of motif occurence in (L-K+1) positions
ey<-matrix(0,nrow=N,ncol=(L-K+1))  # E(yi=j)


####iteration
iteration_times=100
iteration_counter=1
while (iteration_counter<iteration_times){
  
#####  E step 
for (i in 1:N){
  for (j in 1:(L-K+1)){
    if(j==1){
      a=1
      b=1
      for (l in j:(j+K-1)){ b<-b*theta_big[x[i,l],(l-j+1)]}
      c=1
      for (l in (j+K):L){ c<-c*theta_0[x[i,l]]}
    }
    else{if(j==L-K+1){
      a=1
      for (l in 1:(j-1)){ a<-a*theta_0[x[i,l]]}
      b=1
      for (l in j:(j+K-1)){ b<-b*theta_big[x[i,l],(l-j+1)]}
      c=1
    }
      else{
        a=1
        for (l in 1:(j-1)){ a<-a*theta_0[x[i,l]]}
        b=1
        for (l in j:(j+K-1)){ b<-b*theta_big[x[i,l],(l-j+1)]}
        c=1
        for (l in (j+K):L){ c<-c*theta_0[x[i,l]]}
      }
      }
    ey[i,j]<-(lamda[j])*a*b*c   
  }
  ey[i,]<-ey[i,]/sum(ey[i,])
}   #update ey according to theta_0, theta_big and lamda



######  M step (packed as function f.M)
for(j in 1:length(lamda)){
  lamda[j]<-sum(ey[,j])/N
}   #update lamda according to ey


for(k in 1:4){
  sum_theta_0=0
  for (i in 1:N){
    for (j in 1:(L-K+1)){
      if(j==1){
        counter1=0
        counter2=0
        for(l in (j+K):L){if(x[i,l]==k){counter2=counter2+1}}
        
      }
      else{if(j==L-K+1){
        counter1=0
        for(l in 1:(j-1)){if(x[i,l]==k){counter1=counter1+1}}
        counter2=0
      }else{
        counter1=0
        for(l in 1:(j-1)){if(x[i,l]==k){counter1=counter1+1}}
        counter2=0
        for(l in (j+K):L){if(x[i,l]==k){counter2=counter2+1}}
      }}
    
      sum_theta_0=sum_theta_0+ey[i,j]*(counter1+counter2)
    }
  }
  theta_0[k]<-sum_theta_0/(N*(L-K))
} #update theta_0 according to ey


for(l in 1:K){
  for(k in 1:4){
    temp=0
    for(i in 1:N){
      for (j in 1:(L-K+1)){
        if(x[i,l+j-1]==k){temp=temp+ey[i,j]}
      }
    }
    theta_big[k,l]<-temp/N
  }
}  #update theta_big according to ey

iteration_counter=iteration_counter+1

}


#####report motif
start_point<-apply(x,1,which.max)  #start point of each motif in different sequences
motif<-1:N  #initialization
for (i in 1:N) { motif[i]<-substr(mydata[i,],start_point[i],start_point[i]+K-1)}
cat(motif, file = "motif_K8.txt", sep = "\n")


























