## SMOTE by hand as well as with Rose package
## Breitzman 10/9/2018

setwd("E:\\Rowan\\Classes\\DM2\\Fall2018\\Week1\\WisconsinBreastCancer")
f=read.csv(file="wdbc_data_abclean.csv",header=F,stringsAsFactors = TRUE)

dim(f)
f[1,]

## We don't need the first column, it's just an id
ff <-subset(f,select=-V1)
dim(ff)

library(plyr)
count(ff,c("V2"))
## 357 benign
## 212 malignant


ff[1:3,]
## You might recall that we got an excellent prediction of v2 with 
## just v26 and v30  we'll reduce the set to just those attributes

newF <- ff[,c(1,25,29)]
newF[1:3,]

maxs <- apply(newF, 2, max)
mins <- apply(newF, 2, min)
scaledF <- as.data.frame(scale(newF, center = mins, scale = maxs - mins))


set.seed(2)
train=sample(1:nrow(scaledF),nrow(scaledF)*(8/10))
test=-train

trainingData=scaledF[train,]
testingData=scaledF[test,]
dim(trainingData)
dim(testingData)
trainingData[1:3,]

formula = as.factor(V2)~V26+V30

## Let's compare this to a single tree using 
library(rpart)
treeFit <- rpart(formula,
                 data=trainingData,method="class")

testingData$result1 <- predict(treeFit, testingData,type="class")


count(testingData,c("V2","result1"))

FP <- 2
FN <- 3
TP <- 33
TN <- 76

Accuracy <- (TP + TN)/(TP+TN+FP+FN)
Accuracy

Error <- 1-Accuracy
Error

Precision = TP / (TP + FP)
Precision

Recall = TP / (TP + FN)
Recall

Fscore = (2*Recall*Precision) / (Recall + Precision )
Fscore          

Specificity = TN / (TN + FP)
Specificity

## Some classifiers can be tuned with a cost function
## trees usually can't.  NN's can by using different thresholds
## Sometimes people make up a cost function
## We'll assume that false negatives are bad (5 times worse than false positives)
Cost <- (10*FN + 2*FP)/(TP + TN)
Cost 


## Let's look at some vector distances
trainingData[1:3,]
## so presumably the distance between 2 and 3 should be lesss than 1 and 3. Let's
## see.  We'll use the previously built function vecDistCols
vecDistCols <- function(vec1,vec2,cols){
  d = 0
  for (i in 1:length(cols)){ 
    temp <- as.numeric(vec1[cols[i]]-vec2[cols[i]])
    d <- d + temp*temp
  }
  return(d)
}

vecDistCols(trainingData[2,],trainingData[3,],c(2,3))

vecDistCols(trainingData[1,],trainingData[3,],c(2,3))

## so far so good.  Let's get the 10 closest to 1 and 2
## Let's create a new nearest10 where we specify columns
nearest10cols <- function(tdata,targetV,cols){
  rows = dim(tdata)[1]
  m = matrix(,nrow=rows,ncol=3)
  colnames(m)<-c("r","dist","Q")
  for (i in 1:rows){
    m[i,1] <- i
    m[i,2] <- vecDistCols(tdata[i,],targetV,cols)
    m[i,3] <- tdata[i,1]
  }
  print(m[order(m[,2])[1:10],])
}

nearest10cols(trainingData,trainingData[1,],c(2,3))
#perfect

nearest10cols(trainingData,trainingData[2,],c(2,3))
## this is working great.

## Let's do a SMOTE by oversampling the 1's
count(trainingData$V2)
## we need 103 1's

## first get a random set of 1's
t <- trainingData[which(trainingData$V2==1),]
dim(t)
## This will return a random vector with V2==1.  Why?
t[sample(176,1),]

syntheticVec <- function(vec1,vec2){
  vec3 <- vec1  #make a copy of vec1
  for (i in 1:dim(vec1)[2]){
    d <- as.numeric(vec1[i]-vec2[i])
    d <- d*runif(1)
    vec3[i]<-vec3[i]+d
  }
  return(vec3)
}

##Let's see if it works
t1<-t[sample(176,1),]
t2<-t[sample(176,1),]
vecDistCols(t1,t2,c(2,3))            

t3<-syntheticVec(t1,t2)
t3
## test it.  Should be less than distance between t1,t2
vecDistCols(t1,t3,c(2,3))
## works great

## Here's a dumb way to append 103 V2==1 cases to the training data
dim(trainingData)

trainingData <- rbind(trainingData,t3)
dim(trainingData)

for (i in 1:102){
  t1<-t[sample(176,1),]
  t2<-t[sample(176,1),]
  t3<-syntheticVec(t1,t2)
  trainingData <- rbind(trainingData,t3)
}
dim(trainingData)
count(trainingData$V2)
trainingData[1:3,]
trainingData[550:558,]
## We see one problem with this method is it sometimes creates negative attributes
## we'll ignore that.
## another problem with what we've done is we added a bunch of positive cases at the 
## end of the file.  So we'll rescramble the training set

trainingData<-trainingData[sample(558,558),]
dim(trainingData)
trainingData[550:558,]
## Looks scrambled to me

## Now let's rebuild the tree and see if we do better than last time
treeFit <- rpart(formula,
                 data=trainingData,method="class")

testingData$result2 <- predict(treeFit, testingData,type="class")


count(testingData,c("V2","result2"))

FP2 <- 4
FN2 <- 2
TP2 <- 34
TN2 <- 74

Accuracy2 <- (TP2 + TN2)/(TP2+TN2+FP2+FN2)
Accuracy
Accuracy2
## Less accurate but who knows how 10 trials would go


Error2 <- 1-Accuracy2
Error
Error2



Precision2 = TP2 / (TP2 + FP2)
Precision
Precision2

Recall2 = TP2 / (TP2 + FN2)
Recall
Recall2
## Recall a little better but again who knows how 10 trials would go

Fscore2 = (2*Recall2*Precision2) / (Recall2 + Precision2 )
Fscore          
Fscore2

Specificity2 = TN2 / (TN2 + FP2)
Specificity
Specificity2

Cost2 <- (10*FN2 + 2*FP2)/(TP2 + TN2)
Cost 
Cost2
## Cost went down, but again...


## Let's use ROSE now
library(ROSE)

# go back to our previous training set
set.seed(2)
train=sample(1:nrow(scaledF),nrow(scaledF)*(8/10))
test=-train

trainingData=scaledF[train,]


count(trainingData,c("V2"))
## unbalanced.  It's important that we use SMOTE only on the training data
## and leave the testing data alone.

balancedTrainingData = ovun.sample(V2 ~., data = trainingData, method = "both", p = 0.5, seed = 1, N = nrow(scaledF))$data

count(balancedTrainingData,c("V2"))
## A bit more balanced
## not sure what ROSE does exactly.  I would've expected closer numbers but we'll see

treeFit <- rpart(formula,
                 data=balancedTrainingData,method="class")

testingData$result3 <- predict(treeFit, testingData,type="class")


count(testingData,c("V2","result1","result2","result3"))
count(testingData,c("V2","result3"))

FP3 <- 3
FN3 <- 4
TP3<- 32
TN3 <- 75

Accuracy3 <- (TP3 + TN3)/(TP3+TN3+FP3+FN3)
Accuracy
Accuracy2
Accuracy3
## Less accurate but who knows how 10 trials would go


Error3 <- 1-Accuracy3
Error
Error2
Error3


Precision3 = TP3 / (TP3 + FP3)
Precision
Precision2
Precision3

Recall3 = TP3 / (TP3 + FN3)
Recall
Recall2
Recall3

Fscore3 = (2*Recall3*Precision3) / (Recall3 + Precision3 )
Fscore          
Fscore2
Fscore3

Specificity3 = TN3 / (TN3 + FP3)
Specificity
Specificity2
Specificity3

Cost2rose <- (10*FN3 + 2*FP3)/(TP3 + TN3)
Cost 
Cost2
Cost2rose
## It would appear that the SMOTE done by hand outperforms the ROSE package
## but that may not be true for multiple trials or with a an SVM or NN model


