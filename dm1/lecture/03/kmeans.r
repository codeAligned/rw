library("lsa")
library("gdata")
getwd()
setwd("E:\\Rowan\\Classes\\DM1\\Summer2018\\Lecture3")
movies=read.csv("movies8.csv",header=TRUE,sep=",")
head(movies)
movies[,2]

Breitz=movies$Breitzman
Mason=movies$Mason
Thomas=movies$Thomas
U2=movies$User2
U3=movies$User3
U5=movies$User5
U6=movies$User6
U8=movies$User8


#kmeans clustering
#we have to pick the number of clusters we want.  We'll choose 3.
#arbitrarily choose Breitz, Mason, and Thomas for the 3 initial clusters
c1=Breitz
c2=Mason
c3=Thomas
matrix=cbind(Breitz,Mason,Thomas,U2,U3,U5,U6,U8,c1,c2,c3)
simMat=cosine(matrix)
round(simMat,3)
#reset c1, c2, c3 based on closest distances
c1=Breitz+U2+U8
c2=Mason+U3+U5+U6
c3=Thomas
matrix=cbind(Breitz,Mason,Thomas,U2,U3,U5,U6,U8,c1,c2,c3)
simMat=cosine(matrix)
round(simMat,3)
#clusters didn't change so we're done


#Try different choices
c1=U8
c2=U6
c3=U5
matrix=cbind(Breitz,Mason,Thomas,U2,U3,U5,U6,U8,c1,c2,c3)
simMat=cosine(matrix)
round(simMat,3)

c1=Breitz+U8
c2=U2+U3+U6
c3=Mason+Thomas+U5
matrix=cbind(Breitz,Mason,Thomas,U2,U3,U5,U6,U8,c1,c2,c3)
simMat=cosine(matrix)
round(simMat,3)
c1=Breitz+U8
c2=U2+U3+U6
c3=Mason+Thomas+U5
matrix=cbind(Breitz,Mason,Thomas,U2,U3,U5,U6,U8,c1,c2,c3)
simMat=cosine(matrix)
round(simMat,3)
#Converged, but clusters are different from before
#this is a well known problem with kMeans clustering.
#final clusters can depend on choice of initial clusters
#generally speaking if there is a lot of data and clear
#differences between clusters, it usually converges to
#the same result
