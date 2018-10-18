setwd("C:/Users/Tony/Dropbox/Rowan/DM2/Lecture1/WisconsinBreastCancer")
f=read.csv(file="wdbc_data_abclean.csv",header=F,stringsAsFactors = TRUE)

dim(f)
f[1,]

## We don't need the first column, it's just an id
ff <-subset(f,select=-V1)
dim(ff)

library(plyr)
count(ff,c("V2"))
## 357 benign, 212 malignant


set.seed(2)
train=sample(1:nrow(ff),nrow(ff)*(8/10))
test=-train

trainingData=ff[train,]
testingData=ff[test,]
dim(trainingData)
dim(testingData)
library("neuralnet")

formula = V2~V3+V4+V5+V6+V7+V8+V9+V10+V11+V12+V13+V14+V15+V16+V17+V18+V19+V20+V21+V22+V23+V24+V25+V26+V27+V28+V29+V30+V31+V32

nnet<-neuralnet(formula,trainingData, hidden=32, threshold=0.1)
results<-compute(nnet,testingData[,2:31])
testingData$result<- sapply(results$net.result, function(b) {
  if (b<=.5){
    return(0)
  }else{
    return(1)
  }})
count(testingData,c("V2","result"))
err = 5/(5+76+33)
err

library(e1071)

## We make V2 a factor becuase if it's a factor the SVM call
## solves as classification.  Otherwise it attempts a regression
## in other words it will return a 0 or 1 in this case rather than a range between 0 and 1
formula = as.factor(V2)~V3+V4+V5+V6+V7+V8+V9+V10+V11+V12+V13+V14+V15+V16+V17+V18+V19+V20+V21+V22+V23+V24+V25+V26+V27+V28+V29+V30+V31+V32

svm_model <- svm(formula, data=trainingData)
summary(svm_model)

testingData$result <- predict(svm_model,testingData)
count(testingData,c("V2","result"))
err = 2/(2+78+34)
err


trainingData[1,]

x <- subset(trainingData, select=-V2)
y <- as.factor(trainingData$V2)
tail(y)

svm_model1 <- svm(x,y)
summary(svm_model1)
xTest <-subset(testingData, select=c(-V2,-result))
yTest <- testingData$V2
pred <- predict(svm_model1,xTest)

table(pred,yTest)
err = 2/(2+78+34)
err

svm_tune <- tune(svm, train.x=x, train.y=y, 
                 kernel="radial", ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))
print(svm_tune)



svm_model_after_tune <- svm(as.factor(V2) ~ ., trainingData, kernel="radial", cost=10^(-1:1), gamma=0.01)
summary(svm_model_after_tune)

pred <- predict(svm_model_after_tune,xTest)
table(pred,yTest)
## Tuning made it slightly worse.  Still better than the neural net