


vecs<-read.csv("C:\\Users\\Tony\\Dropbox\\Rowan\\DM2\\Lecture12\\vecs2c.txt",header=FALSE,stringsAsFactors=TRUE)

dim(vecs)
vecs2 <-t(vecs)
vecs2[1:5,1:5]

vecs3<-as.data.frame(vecs2[2:2001,])
vecs3[1:5,1:5]
colnames(vecs3)<-vecs2[1,]
library(ggplot2)

vecs3[1:5,1:5]
dim(vecs3)

mymatrix <- matrix(nrow=2000,ncol=1292)

mymatrix[1:5,1:5]
for (i in 1:2000){
  for (j in 1:1292){
    mymatrix[i,j]<-as.integer(as.character(vecs3[i,j]))
  }
}
mymatrix[1:5,1:5]
rownames(mymatrix)<-rownames(vecs3)
colnames(mymatrix)<-colnames(vecs3)
dim(mymatrix)

##myheatmap <- heatmap(mymatrix[1:50,1:50], Rowv=NA, Colv=NA, col = cm.colors(256), scale="column", margins=c(5,10))


library(seriation)
mat2<-seriate(mymatrix, method = "PCA_angle", control = NULL, margin = 2)
mat2
colnames(mymatrix)[1:100]
colnames(mymatrix[,get_order(mat2)])[1:100]

library(plyr)

count(substr(colnames(mymatrix)[1:100],1,4))
count(substr(colnames(mymatrix[,get_order(mat2)])[1:100],1,4))

count(substr(colnames(mymatrix)[100:200],1,4))
count(substr(colnames(mymatrix[,get_order(mat2)])[100:200],1,4))

count(substr(colnames(mymatrix)[300:400],1,4))
count(substr(colnames(mymatrix[,get_order(mat2)])[300:400],1,4))

count(substr(colnames(mymatrix)[400:500],1,4))
count(substr(colnames(mymatrix[,get_order(mat2)])[400:500],1,4))

list_seriation_methods("matrix")


d<-dist(t(mymatrix))

s <- seriate(d,"TSP")
s
get_order(s)[1:10]
t(mymatrix)[get_order(s)[1:10],1:10]
