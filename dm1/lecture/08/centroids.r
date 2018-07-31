x<-c(1,1,2,6,6,7,7)
y<-c(9,10,9.5,1,2,1.5,3)
plot(y~x)

m<-matrix(data=cbind(x,y),nrow=7,ncol=2)
colnames(m)<-c("x","y")
rownames(m)<-c("a","b","c","q","r","s","t")

m
library("lsa")

tm <- t(m)
tm

simMat<-cosine(tm)
simMat

##what's the centroid of a,b,c?
c1.x<-1+1+2
c1.y<-9+10+9.5

##what's the centroid of q,r,s,t
c2.x<-6+6+7+7
c2.y<-1+2+1.5+3




c1<-cbind(c1.x,c1.y)
c2<-cbind(c2.x,c2.y)

m2<-cbind(tm,t(c1),t(c2))
colnames(m2)[8]<-"c1"
colnames(m2)[9]<-"c2"

m2

cosine(m2)

plot(t(m2),col=c("blue","blue","blue","blue","blue","blue","blue","red","red"))

##Notice the centroid vectors do indeed have angles that fall in between their respective
##clusters.  But they are somehow unsatisfying to look at.
##This doesn't matter in higher dimensions because we can't visualize them anyway
##However, if it bothers you we can always turn all of our vectors into unit vectors
##without affecting the angles


m2

m3<-m2
norm1<-sqrt(m3[1,]*m3[1,] + m3[2,]*m3[2,])
norm1

for (i in 1:2){
  for (j in 1:9){
    m3[i,j]<-m3[i,j]/norm1[j]
  }
}
m3
plot(t(m3),col=c("blue","blue","blue","blue","blue","blue","blue","red","red"))

cosine(m3)

cosine(m2)

## Do we get the same similarity matrices using normalized and un-normalized vectors?
## probably, but let's see

cosine(m3)-cosine(m2)

## 10^(-17) is 0 in my book, but still it's unsatisfying

round(cosine(m3)-cosine(m2))

##Bottome line:
##
##When computing cosine similarities we can compute the centroid of a cluster by adding
##all of the vectors in the cluster together.
##
##You might also see in papers and books that all of the vectors first get normalized
##to unit vectors and the centroids get normalized to unit vectors.
##
##Don't let this confuse you.  It's a nicety and some people do it and some don't


##Let's look at Euclidean centroids
##
plot(m)
m

##What's the centroid of a,b,c?
##Standard formula is sum of x components divided by number of x components and
##sum of y components divided by number of y components
c1.x <- (1+1+2)/3
c1.y <- (9+10+9.5)/3

c2.x <- (6+6+7+7)/4
c2.y <- (1+2+1.5+3)/4

c1<-cbind(c1.x,c1.y)
c2<-cbind(c2.x,c2.y)

m4<-cbind(tm,t(c1),t(c2))
colnames(m4)[8]<-"c1"
colnames(m4)[9]<-"c2"

plot(t(m4),col=c("blue","blue","blue","blue","blue","blue","blue","red","red"))
