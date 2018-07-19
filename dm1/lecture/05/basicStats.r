## Breitzman 7/18/2018
## Basic stats plus regression


getwd()
##setwd("C:/Users/abrei/Desktop/DMweek5/cereals")
mydata=read.csv("cereals.CSV",header=TRUE,sep=",")
dim(mydata)
head(mydata)


manuf<-mydata$Manuf
sugar<-mydata$Sugars
mean(sugar)
#we need to remove the NA to get the mean
sugar
data2<-subset(mydata,Sugars!="NA")
sugar<-data2$Sugars
manuf<-data2$Manuf
mean(sugar)
median(sugar)
mode(sugar)
#a feature of R is that mode tells the type of variable.
#to get the mode is a little trickier.  Here is one way
ux<-unique(sugar)
ux
ux[which.max(tabulate(match(sugar, ux)))]
#mode is 3
#double check
sort(sugar)
#note 13 instances of 3 grams; so 3 is the mode

#we can also use the table command to get frequencies
table(sugar)
#once again we see mode is 3
  
library(plyr)  
count(sugar)  
  
#With R there are always many ways to do things
#Here's one more
#draw a histogram
hist(sugar)

#previous histogram is not particularly useful for finding mode;
#if we had more granularity then we could find it; use breaks=16 since range is 0-15
hist(sugar,breaks=16)

#Now it's clear our mode is 3. That's enough of that

temp<-data2[c("Rating","Calories","Sodium")]
boxplot(temp)

# Note that Calories has many data points that are potential outliers
# Rating has one potential outlier and Sodium has a very large range
rating<-temp$Rating 
sd(rating)
mean(rating)
median(rating)
table(round(rating))
#Mode is 41
#Mean, Median, Mode all between 40 and 42.
#likely a normal distribution except for outlier at 94
max(rating)
(max(rating)-mean(rating))/sd(rating)
#93.7 is 3.6 standard deviations from the mean
  

hist(rating,breaks=20)


#Looks like a normal distribution except for the very high rating
#let's investigate
vars<-c("Calories","Protein","Fat","Sodium","Fiber","Carbo","Sugars","Potass","Vitamins","Rating")
data4<-data2[vars]
sort1<-data4[order(-data4$Rating),]
head(sort1)
# Lowest calories, highest protein, no fat, no sugar, high fiber, high vitamins; 
# 93.7 probably accurate
  
  
#Now let's do some linear regression
#We would expect a negative correlation between sugar and rating
plot(rating~sugar,main="rating v sugar (g)")


#we see a loose negative correlation
#now let's make a linear regression line
lm.out=lm(rating~sugar)
plot(rating~sugar,main="rating v sugar (g)"); abline(lm.out,col="blue")

#Not a great predictor; 
#we see that 6 grams of sugar predicts a rating of about 50, 
#but actual ratings are between 38 and 70
#get summary stats for regression
summary(lm.out)

#R squared of .58 is not great in terms of prediction value.
#standard error of 9.166 indicates a measure of the typical error 
#in prediction which is not great
#Let's compute prediction errors
  
data2$predict<-59.85-(2.46*sugar)
data2$predictErr<-data2$Rating-data2$predict


vars<-c("Name","Sugars","Rating","predict","predictErr")
data3<-data2[vars]
head(data3)
tail(data3)
sort1<-data3[order(-data3$predictErr),]
head(sort1)
tail(sort1)
hist(data3$predictErr)
          
#Note the predicted errors are only truly awful for a few cereals.  
#Errors follow a slightly skewed mostly normal dist
          
