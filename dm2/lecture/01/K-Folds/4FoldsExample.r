
## Simple code to do k-Folds validation
## You could use the caret package, but this is simple enough to implement
## and you know exactly what the code is doing

setwd("C:/Users/Tony/Dropbox/Rowan/DM2")
names1=read.csv("names.csv",header=T,stringsAsFactors=T)
names1


## Randomize rows of names1
names1R<-names1[sample(nrow(names1)),1]
folds <- cut(seq(1,nrow(names1)),breaks=4,labels=FALSE)
df <- data.frame(folds,names1R)
df
for(i in 1:4){
  #Segement your data by fold using the which() function 
  testIndexes <- which(folds==i,arr.ind=TRUE)
  testData <- df[testIndexes, ]
  trainData <- df[-testIndexes, ]
  #Use the test and train data partitions however you desire...
  #We'll print them here, but we will generally use them to train and test models
  print(trainData)
  print(testData)
  cat("\n")
}

