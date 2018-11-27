
##Breitzman 11/6/2018
##random1 returns noise between .5 and -.5
random1<- function(){
  (.5-(sample(10000,1)/10000))
}


data<-data.frame(replicate(2,sequence(100)))
for (i in 1:100){
  data$Err[i] <-random1()/10
  data$X2[i] <-random1()
}
data[1:5,]
plot(data$X1,data$X2,type="l")
mean(data$X2)
mean(data$X2[1:20])
mean(data$X2[21:40])
var(data$X2)
var(data$X2[1:20])
## means are close, variance close.  Might be stationary even though
## there is no discernable pattern

##install.packages("tseries")
library(tseries)
adf.test(data$X2, alternative="stationary", k=0)

## Low p-value.  Stationary enough 
## let's check one that is not stationary
## this should act like a random walk
for (i in 2:100){
  data$X2[i] <- data$X2[i-1]  + random1()
}
plot(data$X1,data$X2,type="l")
mean(data$X2)
mean(data$X2[1:20])
mean(data$X2[21:40])
var(data$X2)
var(data$X2[1:20])
adf.test(data$X2, alternative="stationary", k=0)
## high p-value. not stationary
## let's take first difference and see if that's stationary
data$X3<-0
for (i in 2:100){
  data$X3[i]<-data$X2[i]-data$X2[i-1]
}
plot(data$X1,data$X3,type="l")
mean(data$X3)
mean(data$X3[1:20])
mean(data$X3[21:40])
var(data$X3)
var(data$X3[1:20])
adf.test(data$X3, alternative="stationary", k=0)
## cool, we made it stationary with the first difference


## Let's do a real example
##install.packages("data.table")
library(data.table)
mydat <- fread('https://www.analyticsvidhya.com/wp-content/uploads/2016/02/AirPassengers.csv')
dim(mydat)
mydat[1:5,]
mydat$X<-1:144
mydat[1:5,]
names(mydat)<-c("month","numPassengers","t")
mydat[1:5,]

plot(mydat$t,mydat$numPassengers,type="l")
## we've seen this before; we have to fit a trendline and subtract it out
abline(reg=lm(mydat$numPassengers~mydat$t))
adf.test(mydat$numPassengers, alternative="stationary", k=0)
## stationary enough; we can probably do better if we take a log
adf.test(log(mydat$numPassengers), alternative="stationary", k=0)
## slight improvement; let's see if a difference improves
adf.test(diff(log(mydat$numPassengers)), alternative="stationary", k=0)
## awesome



## Arima takes a parameter (p,d,q) where p is related to the AR part,
## d is the amount of differencing
## and q is related to the moving average or MA part.
## we saw above that a d of 1 will work well.  We can experiment with
## other values but I'm too lazy

## for p and q there is a whole literature on using AIC and BIC charts to 
## choose the best parameter.  Instead we'll use auto-arima and let
## it choose the parameters

##install.packages("forecast")
library(forecast)
fit1 <- auto.arima(diff(log(mydat$numPassengers)))
fit1
## 4,0,2 really means 4,1,2 because we took a diff meaning d=1.  
## We also know that this is seasonal with a period of 12 months

fit <- arima(
  log(mydat$numPassengers), c(4, 1, 2),
  seasonal = list(order = c(4, 1, 2), period = 12))

pred <- predict(fit, n.ahead = 36)
## since it's a log we need to exponentiate results
2.71^pred$pred
dim(mydat)
mydat[1:5,]
myProjection<-data.frame(replicate(3,sequence(36)))
myProjection[1:5,]
dim(myProjection)
for (i in 1:36){
  myProjection$X2[i]<-2.71^pred$pred[i]
  myProjection$X3[i]<-144+i
}
names(myProjection)<-names(mydat)
##append projection after first 12 years
newdat <- rbind(mydat,myProjection)
dim(newdat)
plot(newdat$t,newdat$numPassengers,type="l")
## cool

