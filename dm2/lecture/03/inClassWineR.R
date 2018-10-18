setwd('C:\\Users\\AFMS\\r\\rn\\rw\\dm2\\lecture\\03')
f=read.csv(file="winequality-white.csv",sep=";",header=T,stringsAsFactors = TRUE)
pairs(f2)

f2<-f
for(column in col(f)){
  f2[,column]<-(f[,column]-min(f[,column]))/(max(f[,column])-min(f,column))}
}
min(f$quality)
max(f$quality)
set.seed(2)
train=sample(1:nrow(f2),nrow(f2)*(5/10))
test=-train

trainingData=f2[train,]
testingData=f2[test,]

formula<-quality~fixed.acidity+volatile.acidity+citric.acid+residual.sugar+chlorides+free.sulfur.dioxide+total.sulfur.dioxide+density+pH+sulphates+alcohol
#install.packages("randomForest")
#install.packages("neuralnet")

library(neuralnet)
nnet<-neuralnet(formula,data=trainingData,hidden=c(5,2))
plot(nnet)
results<-compute(nnet,testingData[,1:11])
testingData$results<-results$net.result
#install.packages("plyr")
library("plyr")
sum((testingData$result-testingData$quality)^2)/2449

testingData$quality_3<-
testingData$results_3<-round((testingData$results*6)+3)
testingData$quality_3<-f[test,]$quality
testingData$abserror<-abs(testingData$quality_3 - testingData$results_3)
count(testingData$abserror)
