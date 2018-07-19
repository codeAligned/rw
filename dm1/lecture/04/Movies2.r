# breitzman 7/15/2018
# redo movie clustering
# learning objectives: for loops, manipulating matrices,
# count function as a simpler alternative to aggregate

#install.packages("lsa")
library("lsa")
#install.packages("gdata")
library("gdata")

getwd()
##setwd("C:\\Users\\abrei\\Desktop\\DMweek4")
movies=read.csv("movies8.csv",header=TRUE,sep=",")
head(movies)

Breitz=movies$Breitzman
Mason=movies$Mason
Thomas=movies$Thomas
U2=movies$User2
U3=movies$User5
U3=movies$User3
U5=movies$User5
U6=movies$User6
U8=movies$User8

## Let's learn some new R
## we've never done a for loop yet
## We'll add a new variable that is >0 if the movie is seen
## by at least one person and 0 otherwise
movies$seen<-0
head(movies)
dim(movies)
for (i in 1:100){
  if (Breitz[i]!=0) movies$seen[i]<-1
  if (Mason[i]!=0) movies$seen[i]<-1
  if (Thomas[i]!=0) movies$seen[i]<-1
  if (U2[i]!=0) movies$seen[i]<-1
  if (U3[i]!=0) movies$seen[i]<-1
  if (U5[i]!=0) movies$seen[i]<-1
  if (U6[i]!=0) movies$seen[i]<-1
  if (U8[i]!=0) movies$seen[i]<-1
}

movies[1:10,]
## our variable seems to be working
## Let's remove any movies that weren't seen by
## any of our users.  Anybody remember how to do it?

movies2<-movies[which(movies$seen==1),]
dim(movies2)



Breitz=movies2$Breitzman
Mason=movies2$Mason
Thomas=movies2$Thomas
U2=movies2$User2
U3=movies2$User5
U3=movies2$User3
U5=movies2$User5
U6=movies2$User6
U8=movies2$User8


matrix=cbind(Breitz,Mason,Thomas,U2,U3,U5,U6,U8)
simMat=cosine(matrix)
round(simMat,3)

#install.packages("RFLPtools")
library(RFLPtools)
d = sim2dist(simMat)
d
hierarchical_cluster <- hclust(d, method="average")
plot(hierarchical_cluster)
rect.hclust(hierarchical_cluster, 4)

## U2 and U6 are closest.  Let's see why
movies3<-movies[c('Rank','Title','User2','User6')]
movies3$seen<-0
for (i in 1:100){
  if (movies3$User2[i]!=0) movies3$seen[i]<-1
  if (movies3$User6[i]!=0) movies3$seen[i]<-1
}
movies3[1:10,]

## remove movies not seen by either User2 or User6
movies3<-movies3[-which(movies3$seen==0),]
dim(movies3)
##install.packages("plyr")
library(plyr)
count(movies3,c("User2","User6"))
## 33 movies total. 8 agree, 8 somewhat agree, 
## 2 disagree, 15 one or other didn't see
## does that add up to .64 similarity? maybe

## Let's redo similarity matrix for all users by using
## weighted Euclidean and converting -2 to 0, -1 to .333, 1 to .666, 2 to 1
dim(movies2)
colnames(movies2)
movies2$breitzSaw<-0
movies2$User2Saw<-0
movies2$User3Saw<-0
movies2$ThomasSaw<-0
movies2$User5Saw<-0
movies2$User6Saw<-0
movies2$MasonSaw<-0
movies2$User8Saw<-0
for (i in 1:73){
  if (movies2$Breitzman[i]!=0) movies2$breitzSaw[i]<-1
  if (movies2$User2[i]!=0) movies2$User2Saw[i]<-1
  if (movies2$User3[i]!=0) movies2$User3Saw[i]<-1
  if (movies2$User5[i]!=0) movies2$User5Saw[i]<-1
  if (movies2$User6[i]!=0) movies2$User6Saw[i]<-1
  if (movies2$User8[i]!=0) movies2$User8Saw[i]<-1
  if (movies2$Thomas[i]!=0) movies2$ThomasSaw[i]<-1
  if (movies2$Mason[i]!=0) movies2$MasonSaw[i]<-1
}
movies2[1:10,]
colnames(movies2)
for (i in 1:73){
  for (j in 3:10){
    if (movies2[i,j]==-2)
      movies2[i,j]<-0
    else if (movies2[i,j]==-1)
      movies2[i,j]<-.3333
    else if (movies2[i,j]==1)
      movies2[i,j]<-.6666
    else if (movies2[i,j]==2)
      movies2[i,j]<-1
  }
}
movies2[1:10,3:8]

## Now we need to build a distance matrix
## we'll use Euclidean distance but we'll weight each 
## square difference by 1 if both saw and 0 otherwise

## For practice let's compute weighted distance between User2 and User6
colnames(movies2)
## User2 is in column 4
## User2Saw is in column13
## User6 is in Column 8
## User6Saw is in Column 17
## Note saw column is always 9 columns later for each user
dim(movies2)
u2U6dist<-0
numerator<-0
denom<-0.000001
for (i in 1:73){
  numerator<-numerator+((movies2[i,4]-movies2[i,8])*(movies2[i,4]-movies2[i,8])*movies2[i,13]*movies2[i,17])
  denom<-denom+(movies2[i,13]*movies2[i,17])
}
u2u6dist<-sqrt(numerator)/sqrt(denom)
u2u6dist
## That makes similarity .75
## check using a frequency distribution
count(movies2,c("User2","User6","User2Saw","User6Saw"))
denom<-sqrt(18)
numerator<-sqrt((.333)*(.333)*10)
numerator/denom
## very close; difference is 1.0 - .66 is actually .34

colnames(movies2)
mat <-matrix(,nrow=8,ncol=8)
rownames(mat)<-c("breitz","U2","U3","Thomas","U5","U6","Mason","U8")
colnames(mat)<-rownames(mat)
mat

for (i in 1:8){
  for (j in 1:8){
    numerator=0
    denom=.0000001
    for (k in 1:73){
      numerator<-numerator+((movies2[k,i+2]-movies2[k,j+2])*(movies2[k,i+2]-movies2[k,j+2])*movies2[k,i+11]*movies2[k,j+11])
      denom<-denom+(movies2[k,i+11]*movies2[k,j+11])
    }
    mat[i,j]<-(sqrt(numerator)/sqrt(denom))
  }
}
round(mat,3)

## Note u2 vs u6 same as before and diagonals are 0.  seems to be working
## Note Mason and U8 seem to be identical now.  Let's explore that
count(movies2,c("Mason","User8","MasonSaw","User8Saw"))
## Mason saw a lot more movies than User8, but among those that
## they both saw, they agree on all 9 (5 like, 4 really like)
## In this respect, the current distance measurement seems
## to not only make sense, but it has the advantage that we can
## easily explain why it does what it does (as opposed to cosine dist)

hierarchical_cluster2 <- hclust(mat, method="average")
## it doesn't like our matrix.  We'll fool it
simMat<- 1-mat
simMat
d2<-sim2dist(simMat)
d2
hierarchical_cluster2 <- hclust(d2, method="average")
plot(hierarchical_cluster2)
## Note y-axis is distance
## since we saw that Mason and U8 cluster at 0
## This suggest Breitz and U3 join Mason at about distance .2

hierarchical_cluster2 <- hclust(d2, method="complete")
plot(hierarchical_cluster2)

hierarchical_cluster2 <- hclust(d2, method="single")
plot(hierarchical_cluster2)

