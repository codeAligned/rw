setwd("C:/Users/Tony/Dropbox/Rowan/DM2/Lecture1/WisconsinBreastCancer")
f=read.csv(file="wdbc_data_abclean.csv",header=F,stringsAsFactors = TRUE)

dim(f)
f[1,]

library(plyr)
count(f,c("V2"))
## 357 benign, 212 malignant


set.seed(2)
train=sample(1:nrow(f),nrow(f)*(8/10))
test=-train

trainingData=f[train,]
testingData=f[test,]
dim(trainingData)
dim(testingData)
library("neuralnet")
names(trainingData)
formula = V2~V3+V4+V5+V6+V7+V8+V9+V10+V11+V12+V13+V14+V15+V16+V17+V18+V19+V20+V21+V22+V23+V24+V25+V26+V27+V28+V29+V30+V31+V32
nnet<-neuralnet(formula,trainingData, hidden=64, threshold=0.1)
results<-compute(nnet,testingData[,3:32])
testingData$result<- sapply(results$net.result, function(b) {
  if (b<=.5){
    return(0)
  }else{
    return(1)
  }})
count(testingData,c("V2","result"))
err = 7/(7+77+30)
err

