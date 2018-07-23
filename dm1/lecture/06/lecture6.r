getwd()
#setwd("C:/Users/abrei/Desktop/DMweek6")
credit<-read.csv("credit.csv",header = TRUE, sep = ",", stringsAsFactors = TRUE)
head(credit)
dim(credit)
## Note 92 rows.  
## We know that there are really 8 rows what happened?
## I tried to create the tree using 8 rows and it said we
## didn't have enough data
## Oddly if I duplicate the same 8 rows a bunch of times
## it runs fine


## make a CART tree
##install.packages("tree")
library(tree)
names(credit)
tr=tree(CreditRisk~Savings+HomeValue+Income,credit)
plot(tr);text(tr,pretty=0)


summary(tr)


## Now we'll make a C5.0 tree
##install.packages("C50")
library(C50)

c5tree=C5.0(credit[,1:3],credit[,4:4])
summary(c5tree)

plot(c5tree)


data<-read.csv("censusAdult50k.csv",header = TRUE, sep = ",", stringsAsFactors = TRUE)
head(data)

names(data)

hist(data$Age)


# Put continuous ages into 10 year intervals
data$ageClass<-sapply(data$Age,function(b){
  if (b<20){
    return('under20')
  }else{
    if (b<30){
      return('20-30')
    } else {
      if (b<40){
          return('30-39')
      }else{
          if (b<50){
            return('40-49')
          }else{
              if (b<60){
                  return('50-59')
              }else{
                  return('60+')
              }}}}}}
)
## Note use of sapply class

library(plyr)
count(data$ageClass)

## We need to do the same with the other continuous variables
## we'll divid capital gains into 0, under10k, over10k
data$gainClass<-sapply(data$CapitalGain,function(b){
  if (b==0){
    return('0')
  }else{
    if (b<10000){
      return('1-10k')
    } else {
      return('>10k')
    }}}
)
count(data$gainClass)

## next deal with capital loss
data$lossClass<-sapply(data$CapitalLoss,function(b){
  if (b==0){
    return('0')
  }else{
    if (b<1000){
      return('1-999')
    } else {
        if(b<2000){
            return('1000-1999')
        } else {
            if (b<3000){
                return('2000-2999')
            }else{
                return('3000+')
            }}}}}
)
count(data$lossClass)


## A standard trick in modeling is we take 80% of the data to train the 
## model, and then test on the remaining 20%.  Here's an easy way to 
## do that
data2<-data

set.seed(2)  #we set a seed so that it's repeatable
nrow(data2)
train=sample(1:nrow(data2),0.8*nrow(data2))
test=-train
.8*nrow(data2)
nrow(data2)

## Since we have so much data we'll do 50-50 instead of 80-20
set.seed(2)  #we set a seed so that it's repeatable
nrow(data2)
train=sample(1:nrow(data2),.5*nrow(data2))
test=-train

vars<-c("ageClass","gainClass","lossClass","JobClass","Education","Job","Relationship","Race","Sex","Income")
data2<-data[vars]
#we need to change our new variables to factors or the tree will get confused
data2$ageClass<-as.factor(data2$ageClass)
data2$gainClass<-as.factor(data2$gainClass)
data2$lossClass<-as.factor(data2$lossClass)
trainingData=data2[train,]
testingData=data2[test,]
dim(trainingData)
dim(testingData)

## Here's another tree library
library(rpart)
treeModel=rpart(Income~.,data=trainingData,method="class")
printcp(treeModel)
## As long as this is descending, tree need not be pruned.  If plot
## shows a dip and an ascend then it needs to be pruned
plot(treeModel)
text(treeModel)
## This is unreadable.

##install.packages("rattle")

library(rattle)
rattle()
##install.packages("rpart.plot")
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(treeModel)


summary(treeModel)
treePred = predict(treeModel,testingData,type="class")
testingIncome = data2$Income[test]
mean(treePred != testingIncome)

##one more trick for plotting.  Put into a giant bitmap
png("t2.png",width = 1000,height = 600)
plot(treeModel, compress = FALSE)
##add text but put it onto and angle and change color
text(treeModel,col=rainbow(5)[1:25],srt=25,cex=0.8,pretty=0)
##close file
dev.off()

#we can clean this up a lot by grouping all of the less than high school grad 
#into one category (it won't hurt results)
#similarly we can group some of the blue collar jobs and 
#shorten the names, and group anyone under 30 together

#Now we will make a C5.0 tree
library(C50)
c5tree=C5.0(trainingData[,1:9],trainingData[,10:10])
##note the inputs are different from the previous tree
##rather than create a formula we make the predicted
##variable the second parameter
summary(c5tree)
pred <-predict(c5tree,testingData)
testingIncome = data2$Income[test]
mean(pred != testingIncome)
##15% error.  Better than CART

