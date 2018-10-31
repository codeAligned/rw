
## File: WineTestAgain9.r
## Author: A. Breitzman
## Date: 4/2/2017; revised 6/10/2018
## Description: One v all, one v one
## ------------------------------------------------------------------------

library(e1071)
library("neuralnet")
library("plyr")
setwd("C:/Users/Tony/Dropbox/Rowan/DM2/Lecture4")
whiteWineData <-read.csv("winequality-white.csv",header = TRUE, sep = ";", stringsAsFactors = TRUE)

maxs <- apply(whiteWineData, 2, max)
mins <- apply(whiteWineData, 2, min)
scaledWhite <- as.data.frame(scale(whiteWineData, center = mins, scale = maxs - mins))
names(scaledWhite)

## Unscale quality first
scaledWhite$quality <- 3+6*scaledWhite$quality
count(scaledWhite$quality)


## Baseline 1 Random Forest on all classes

set.seed(2)
train <- sample(1:nrow(scaledWhite),nrow(scaledWhite)*(8/10))
test<- -train

trainingData<-scaledWhite[train,]
testingData<-scaledWhite[test,]

n<-names(scaledWhite)
length(n)
nSub <- n[1:11]
nSub
formula <- as.formula(paste("as.factor(quality) ~", paste(nSub, collapse = " + ")))
formula

trainingData<-scaledWhite[train,]
testingData<-scaledWhite[test,]



library(randomForest)
formula
fitB1 <- randomForest(formula,
                    data=trainingData, 
                    importance=TRUE, 
                    ntree=2000)


testingData$result <- predict(fitB1, testingData)
count(testingData,c("quality","result"))
dim(testingData)
correct <- 11 + 201 +372 + 85 + 9
correct
err <- 980 - correct
err/980
## 69% accurate

## Baseline 2 reduce to 3 classes

## Set B2 to -1 for quality 3-4
## Set B2 to 0 for quality 5,6,7
## Set B2 to 1 for quality 8-9
trainingData$B2 <- sapply(trainingData$quality, function(b) {
  if (b >=8){
    return(1)
  }else{
    if (b>=5){
      return(0)
    }else{
      return(-1)
    }
  }
})

testingData$B2 <- sapply(testingData$quality, function(b) {
  if (b >=8){
    return(1)
  }else{
    if (b>=5){
      return(0)
    }else{
      return(-1)
    }
  }
})

set.seed(2)

n<-names(scaledWhite)
length(n)
nSub <- n[1:11]
nSub
formula <- as.formula(paste("as.factor(B2)~", paste(nSub, collapse = " + ")))
formula


fit0 <- randomForest(formula,
                    data=trainingData, 
                    importance=TRUE, 
                    ntree=2000)


testingData$result0 <- predict(fit0, testingData)
count(testingData,c("B2","result0"))
dim(testingData)
correct <- 10 + 900 + 7
correct
err <- 980 - correct
err/980

## 6% error but only predicts 1/4 of the bad wines and less than 1/4 of the good wines


## Set quality 8-9 to 1 and rest 0 to see if we can
## get a 1 vs all setup to work for quality 8-9 wines
trainingData$Q2 <- ifelse(trainingData$quality>=8,1,0)
testingData$Q2 <- ifelse(testingData$quality>=8,1,0)

formula <- as.formula(paste("as.factor(Q2) ~", paste(nSub, collapse = " + ")))
formula


fit <- randomForest(formula,
                    data=trainingData, 
                    importance=TRUE, 
                    ntree=2000)




testingData$result <- predict(fit, testingData)
count(testingData,c("Q2","result"))
## still only 7 out of 37 good wines correct

count(testingData,c("Q2","quality","result"))
## This suggests a 1 v all approach is not going to work with the 8 and 9 wines



## let's try a 1 v 1 approach and see if we can get a random forest
## to distinguish between 3-4 and 8-9


t <- trainingData[which(trainingData$quality >7),]
dim(t)
s <- trainingData[which(trainingData$quality <5),]
dim(s)
t$Q2 <-1
s$Q2 <-0
temp <- rbind(t,s)
count(temp,c("quality","Q2"))
fit <- randomForest(formula,
                    data=temp, 
                    importance=TRUE, 
                    ntree=2000)
testingData$result <- predict(fit, testingData)
count(testingData,c("Q2","quality","result"))
## Well now we're getting somewhere
## The 0 Q2's are all messed up but that's to be expected
## it's doing a good job of distinguishing between the 3-4 v 8-9


## let's see how we do in predicting 3-4 v 7
t <- trainingData[which(trainingData$quality <=4),]
s <- trainingData[which(trainingData$quality ==7),]

dim(s)
dim(t)
s2samp <- sample(1:nrow(s),140)
s2 <- s[s2samp,]
t$Q2 <-0
s2$Q2 <-1


temp<- rbind(t,s2)
count(temp,c("Q2","quality"))

fit2 <- randomForest(formula,
                    data=temp, 
                    importance=TRUE, 
                    ntree=2000)

testingData$result <- predict(fit2, testingData)
count(testingData,c("Q2","quality","result"))
## good job on the 3-4, ok on the 7

s <- trainingData[which(trainingData$quality ==6),]

dim(s)
dim(t)
s2samp <- sample(1:nrow(s),140)
s2 <- s[s2samp,]
t$Q2 <-0
s2$Q2 <-1


temp<- rbind(t,s2)
count(temp,c("Q2","quality"))

fit3 <- randomForest(formula,
                     data=temp, 
                     importance=TRUE, 
                     ntree=2000)

testingData$result <- predict(fit3, testingData)
count(testingData,c("Q2","quality","result"))
## About a 25% error on the 6's much better on the 3-4



s <- trainingData[which(trainingData$quality ==5),]
t <- trainingData[which(trainingData$quality >=8),]
dim(s)
dim(t)
s2samp <- sample(1:nrow(s),145)
s2 <- s[s2samp,]
t$Q2 <-1
s2$Q2 <-0



temp<- rbind(t,s2)
count(temp,c("Q2","quality"))

fit4 <- randomForest(formula,
                     data=temp, 
                     importance=TRUE, 
                     ntree=2000)

testingData$result <- predict(fit4, testingData)
count(testingData,c("Q2","quality","result"))
## not too bad

s <- trainingData[which(trainingData$quality ==6),]
t <- trainingData[which(trainingData$quality >=8),]
dim(s)
dim(t)
s2samp <- sample(1:nrow(s),145)
s2 <- s[s2samp,]
t$Q2 <-1
s2$Q2 <-0


temp<- rbind(t,s2)
count(temp,c("Q2","quality"))

fit5 <- randomForest(formula,
                     data=temp, 
                     importance=TRUE, 
                     ntree=2000)

testingData$result <- predict(fit5, testingData)
count(testingData,c("Q2","quality","result"))
## Not great, but not awful

s <- trainingData[-which(trainingData$quality ==7),]
t <- trainingData[which(trainingData$quality ==7),]
dim(s)
dim(t)
s2samp <- sample(1:nrow(s),719)
s2 <- s[s2samp,]
t$Q2 <-0
s2$Q2 <-1


temp<- rbind(t,s2)
count(temp,c("Q2","quality"))

fit6 <- randomForest(formula,
                     data=temp, 
                     importance=TRUE, 
                     ntree=2000)

testingData$result <- predict(fit6, testingData)
count(testingData,c("Q2","quality","result"))
## Not great, but not awful


s <- trainingData[which(trainingData$quality ==7),]
t <- trainingData[which(trainingData$quality >=8),]
dim(s)
dim(t)
s2samp <- sample(1:nrow(s),145)
s2 <- s[s2samp,]
t$Q2 <-0
s2$Q2 <-1


temp<- rbind(t,s2)
count(temp,c("Q2","quality"))

fit6 <- randomForest(formula,
                     data=temp, 
                     importance=TRUE, 
                     ntree=2000)

testingData$result <- predict(fit6, testingData)
count(testingData,c("Q2","quality","result"))
## Not great, but not awful




#####################################################
## Let's do the final prediction
## p1 will be 345 v 6789
## p2 will be 34 v 56789
## p3 will be 34567 v 89
## p4 will be 3456 v 789

set.seed(2)
s <- trainingData[which(trainingData$quality <=5),]
t <- trainingData[which(trainingData$quality >=6),]
dim(s)
dim(t)
tsamp <-sample(1:nrow(t),1305)
t2 <- t[tsamp,]
t2$Q2 <-1
s$Q2 <-0


temp<- rbind(s,t2)
count(temp,c("Q2","quality"))

p1 <- randomForest(formula,
                     data=temp, 
                     importance=TRUE, 
                     ntree=2000)

testingData$p1 <-predict(p1, testingData)
count(testingData,c("Q2","quality","p1"))

## now do p2
s <- trainingData[which(trainingData$quality <=4),]
t <- trainingData[which(trainingData$quality >=5),]
dim(s)
dim(t)
tsamp <-sample(1:nrow(t),145)
t2 <- t[tsamp,]
t2$Q2 <-1
s$Q2 <-0


temp<- rbind(s,t2)
count(temp,c("Q2","quality"))

p2 <- randomForest(formula,
                   data=temp, 
                   importance=TRUE, 
                   ntree=2000)

testingData$p2 <- predict(p2, testingData)
count(testingData,c("Q2","quality","p2"))

## now do p3
s <- trainingData[which(trainingData$quality <=7),]
t <- trainingData[which(trainingData$quality >=8),]
dim(s)
dim(t)
ssamp <-sample(1:nrow(s),145)
s2 <- s[ssamp,]
t$Q2 <-1
s2$Q2 <-0


temp<- rbind(s2,t)
count(temp,c("Q2","quality"))

p3 <- randomForest(formula,
                   data=temp, 
                   importance=TRUE, 
                   ntree=2000)

testingData$p3 <- predict(p3, testingData)
count(testingData,c("Q2","quality","p3"))

## now do p4
s <- trainingData[which(trainingData$quality <=6),]
t <- trainingData[which(trainingData$quality >=7),]
dim(s)
dim(t)
ssamp <-sample(1:nrow(s),863)
s2 <- s[ssamp,]
t$Q2 <-1
s2$Q2 <-0


temp<- rbind(s2,t)
count(temp,c("Q2","quality"))

p4 <- randomForest(formula,
                   data=temp, 
                   importance=TRUE, 
                   ntree=2000)

testingData$p4 <- predict(p4, testingData)
count(testingData,c("Q2","quality","p4"))


testingData$result <- as.numeric(testingData$p1)-1 +as.numeric(testingData$p2)-1+as.numeric(testingData$p3)-1+as.numeric(testingData$p4)-1
count(testingData,c("quality","result"))



count(testingData,c("B2","result"))

testingData$predQ2 <- sapply(testingData$result, function(b) {
  if (b ==0){
    return(-1)
  }else{
    if (b==4){
      return(1)
    }else{
      return(0)
    }
  }
})

count(testingData,c("B2","predQ2"))
dim(testingData)
correct <- 32 + 553 + 27
err <- 980 - correct
err/980
## only 62% correct but we get most of the 3-4 and 8-9 picked but also a lot of false positives



################################################################
## One last try
## a1 345 v 6789
## a2 34 v 5
## a3 3456 v 789
## a4 7 v 89
## a1 and a2 == 0 --> 3-4 bad (-1)
## a3 and a4 == 1 --> 8-9 good (1)
## all else goes to ok (0)

set.seed(2)
s <- trainingData[which(trainingData$quality <=5),]
t <- trainingData[which(trainingData$quality >=6),]
dim(s)
dim(t)
tsamp <-sample(1:nrow(t),1305)
t2 <- t[tsamp,]
t2$Q2 <-1
s$Q2 <-0


temp<- rbind(s,t2)
count(temp,c("Q2","quality"))

a1 <- randomForest(formula,
                   data=temp, 
                   importance=TRUE, 
                   ntree=2000)

testingData$a1 <-predict(a1, testingData)
count(testingData,c("Q2","quality","a1"))


## a2 34 v 5
s <- trainingData[which(trainingData$quality <=4),]
t <- trainingData[which(trainingData$quality ==5),]
dim(s)
dim(t)
tsamp <-sample(1:nrow(t),141)
t2 <- t[tsamp,]
t2$Q2 <-1
s$Q2 <-0


temp<- rbind(s,t2)
count(temp,c("Q2","quality"))

a2 <- randomForest(formula,
                   data=temp, 
                   importance=TRUE, 
                   ntree=2000)

testingData$a2 <-predict(a2, testingData)
count(testingData,c("Q2","quality","a1","a2"))

## a3 3456 v 789
s <- trainingData[which(trainingData$quality <=6),]
t <- trainingData[which(trainingData$quality >=7),]
dim(s)
dim(t)
ssamp <-sample(1:nrow(s),862)
s2 <- s[ssamp,]
t$Q2 <-1
s2$Q2 <-0


temp<- rbind(s2,t)
count(temp,c("Q2","quality"))

a3 <- randomForest(formula,
                   data=temp, 
                   importance=TRUE, 
                   ntree=2000)

testingData$a3 <-predict(a3, testingData)
count(testingData,c("Q2","quality","a1","a2","a3"))


## a4 7 v 89
s <- trainingData[which(trainingData$quality ==7),]
t <- trainingData[which(trainingData$quality >=8),]
dim(s)
dim(t)
ssamp <-sample(1:nrow(s),143)
s2 <- s[ssamp,]
t$Q2 <-1
s2$Q2 <-0


temp<- rbind(s2,t)
count(temp,c("Q2","quality"))

a4 <- randomForest(formula,
                   data=temp, 
                   importance=TRUE, 
                   ntree=2000)

testingData$a4 <-predict(a4, testingData)
count(testingData,c("Q2","quality","a1","a2","a3","a4"))

testingData$aresult <- as.numeric(testingData$a1)-1 +as.numeric(testingData$a2)-1+as.numeric(testingData$a3)-1+as.numeric(testingData$a4)-1
count(testingData,c("Q2","aresult","result"))


testingData$pred2Q2 <- sapply(testingData$aresult, function(b) {
  if (b ==0){
    return(-1)
  }else{
    if (b==4){
      return(1)
    }else{
      return(0)
    }
  }
})

count(testingData,c("B2","pred2Q2"))
dim(testingData)
correct <- 24 + 742 + 14
err <- 980 - correct
err/980
## only 80% correct but we only get some 8-9 and 3-4 correct

testingData$result0 <- predict(fit0, testingData)
count(testingData,c("B2","predQ2","pred2Q2","result0"))

bad <- 26
ok <- 102 + 9 + 535 + 9 + 105
good <- 1 + 8 + 6

ok

correct <- bad + ok + good
correct
err <- 980 - correct
err
err/980

## Blend is 72% correct with 26 3-4 predicted, 760 5-6-7 predicted, 15 good predicted





#####################################################################################
## Let's see how adaBoost does compared with random forest.
## we'll just do 7 v 89
## a4 7 v 89
s <- trainingData[which(trainingData$quality ==7),]
t <- trainingData[which(trainingData$quality >=8),]
dim(s)
dim(t)
ssamp <-sample(1:nrow(s),143)
s2 <- s[ssamp,]
t$Q2 <-1
s2$Q2 <-0


temp<- rbind(s2,t)
count(temp,c("Q2","quality"))

a4 <- randomForest(formula,
                   data=temp, 
                   importance=TRUE, 
                   ntree=2000)

testingData$a4 <-predict(a4, testingData)
count(testingData,c("quality","a4"))
correct <- 100+22
err <- 61+15
err/(err+correct)

library(freestats)
names(temp)
## We'll start with 50 trees since we know our data is highly predictive
temp[1:10,14]
t$Q2 <-1
s2$Q2 <- -1


temp<- rbind(s2,t)
count(temp,c("Q2","quality"))
names(temp)
res <- adaBoost(dat.train=temp[1:11],y.train=temp[13],B=50)
result6<-classify(res,testingData[,1:11])
testingData$a4b <- result6
count(testingData,c("quality","a4b"))

correct <- 4+ 37
err <- 157
err/(err+correct)
