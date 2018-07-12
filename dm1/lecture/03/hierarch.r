# breitzman 1/30/2018
# hierarchical clustering movies

#install.packages("lsa")
library("lsa")
#install.packages("gdata")
library("gdata")

getwd()
setwd("E:\\Rowan\\Classes\\DM1\\Summer2018\\Lecture3")
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

#Hierarchical Clustering 
#Naive Innefficient way
matrix=cbind(Breitz,Mason,Thomas,U2,U3,U5,U6,U8)
simMat=cosine(matrix)
round(simMat,3)

upperTriangle(simMat,diag=TRUE)<-0
round(simMat,3)

max(simMat)
which(simMat>.64)
# closest users are U2 and U6
# we need to merge them and recalculate
U2U6=U2+U6
matrix=cbind(Breitz,Mason,Thomas,U2U6,U3,U5,U8)
simMat=cosine(matrix)
upperTriangle(simMat,diag=TRUE)<-0
round(simMat,3)
max(simMat)
# closest users are U5 and Mason
# we need to merge them and recalculate
U5Mason=U5+Mason
matrix=cbind(Breitz,U5Mason,Thomas,U2U6,U3,U8)
simMat=cosine(matrix)
upperTriangle(simMat,diag=TRUE)<-0
round(simMat,3)
max(simMat)

# closest users are U3 and U5Mason
# we need to merge them and recalculate
U3U5Mason=U3+U5Mason
matrix=cbind(Breitz,U3U5Mason,Thomas,U2U6,U8)
simMat=cosine(matrix)
upperTriangle(simMat,diag=TRUE)<-0
round(simMat,3)
max(simMat)

# closest users are U2U6 and U3U5Mason
# we need to merge them and recalculate
U2U6U3U5Mason=U2U6+U3U5Mason
matrix=cbind(Breitz,U2U6U3U5Mason,Thomas,U8)
simMat=cosine(matrix)
upperTriangle(simMat,diag=TRUE)<-0

round(simMat,3)
max(simMat)

# closest users are Breitz andU2U6U3U5Mason
# we need to merge them and recalculate
breitzU2U6U3U5Mason=Breitz+U2U6U3U5Mason
matrix=cbind(breitzU2U6U3U5Mason,Thomas,U8)
simMat=cosine(matrix)
upperTriangle(simMat,diag=TRUE)<-0
round(simMat,3)
max(simMat)

# Draw a dendrogram on the board and show how to cut to make 2 clusters, 
# 3 clusters, 4 clusters...



# Notice that if we had 100 x 100 clusters recalculating after each merge would
# be rather inefficient since computing a similarity matrix is expensive
# Let's redo a little more efficiently

#Let's repeat but without recalculating the entire similarity matrix
matrix=cbind(Breitz,Mason,U3,U5,Thomas,U2,U6,U8)
simMat = cosine(matrix)
round(simMat,3)

upperTriangle(simMat,diag=TRUE)<-0
round(simMat,3)
max(simMat)


# We need to merge U2 and U6 but without rebuilding the entire matrix
# we'll use the minimal link method which means we merge U2 and U6 
# by replacing each U2 entry with min(U2,U6) and setting u6 to 0

simMat[6,1]=min(simMat[6,1],simMat[7,1])
simMat[7,1]=0
simMat[6,2]=min(simMat[6,2],simMat[7,2])
simMat[7,2]=0
simMat[6,3]=min(simMat[6,3],simMat[7,3])
simMat[7,3]=0
simMat[6,4]=min(simMat[6,4],simMat[7,4])
simMat[7,4]=0
simMat[6,5]=min(simMat[6,5],simMat[7,5])
simMat[7,5]=0
simMat[7,6]=0
simMat[8,6]=min(simMat[8,6],simMat[8,7])  #why ?
simMat[8,7]=0                             #why ?


round(simMat,3)
max(simMat)

# that was a bit of a pain.  Seems like something we should put into
# a subroutine.  Luckily your professor was nice enough to do that
# take a look at mymerge.r and discuss differences between min-link,
# max link, avg link.

source("myMergeF.r",echo=T)
round(simMat,3)
max(simMat)
# .622 is in row 2 and 4 (Mason and U5).  Merge them
simMat = myMinMerge(simMat,2,4)
round(simMat,3)
max(simMat)
# Now merge U3 and Mason (rows 2 and 3)
simMat = myMinMerge(simMat,2,3)
round(simMat,3)
max(simMat)
# Merge U8 and Breitz (rows 1 and 8)
simMat = myMinMerge(simMat,1,8)
round(simMat,3)
max(simMat)
# Merge Mason and U2 (rows 2 and 6)
simMat = myMinMerge(simMat,2,6)
round(simMat,3)
max(simMat)
# very low similarity.  We'll stop now
# draw dendrogram on board
# #Final Clusters are (Thomas), (Breitz, U8), (Mason, U2, U3, U5, U6)

# We'll repeat using maximal merges just to show there is a difference
simMat = cosine(matrix)
round(simMat,3)

upperTriangle(simMat,diag=TRUE)<-0
round(simMat,3)
max(simMat)
simMat
#Merge U2 and U6 (row 6,7)
simMat = myMaxMerge(simMat,6,7)
max(simMat)
simMat
#merge U2,U5 row 4, 6
simMat = myMaxMerge(simMat,4,6)
max(simMat)
simMat
#Merge Mason, U5
simMat = myMaxMerge(simMat,2,4)
max(simMat)
simMat
#Merge Mason, U3 (row 2,3)
simMat = myMaxMerge(simMat,2,3)
max(simMat)
simMat
#Merge Mason, U8
simMat = myMaxMerge(simMat,2,8)
simMat
# Last steps will merge breitzman with Mason and then Thomas
# draw dendrogram and compare to previous


# Note we can completely automate this of course
data=cbind(Breitz,Mason,Thomas,U2,U3,U5,U6,U8)
name_vector= c("Breitz", "Mason", "Thomas", "U2", "U3", "U5", "U6", "U8")
head(data)
simMat=cosine(data)
#install.packages("RFLPtools")
library(RFLPtools)
d = sim2dist(simMat)
d
hierarchical_cluster <- hclust(d, method="average")
plot(hclust(d, method="average"))
rect.hclust(hierarchical_cluster, 7)

  

