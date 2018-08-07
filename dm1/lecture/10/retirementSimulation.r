
## File: Lecture10.r 
## Author: A. Breitzman
## Date: 8/5/2018
## Description: Retirement Savings Simulation
## Intro to reading files and simulations
## ------------------------------------------------------------------------


## to get the current working directory use
getwd()

## if we wish to open a file in a certain directory we can use setwd as follows
setwd("E:\\Rowan\\Classes\\DM1\\Summer2018\\Lecture10")
getwd()

f<-read.csv(file="sp500.csv",header=TRUE,sep=",")
dim(f)
##1356 rows and 3 columns

##let's look at first 6 rows
head(f)

##we can also look at last 6 rows
tail(f)


##or any particular set of rows as follows
f[3:5,]

## suppose we have a million dollars saved up for retiremsnt
savings <- 10^6

## If we have the savings invested in the S&P 500 how much might we
## have in the next 10 months?  To simulate this we pick a random 
## historical gain and apply it to our savings.
## for example for next month we get a random gain/loss as follows

dim(f)
set.seed(123)
sample(1356,1)
gain<-f[sample(1356,1),3]
savings<- savings + savings*gain
savings

##to see savings after 10 months we can do 
savings <- 10^6

for (i in 1:10){
  savings <- savings + savings*f[sample(1356,1),3]
}
savings


## Now suppose we want to see if we have enough savings to retire
## assuming we retire at 70 and live until age 90, we need
## 20 years of payments which is 240 months.
## If we take out 5000 per month will the money last 240 months?

savings<-10^6
for (i in 1:240){
  savings <- savings + savings*f[sample(1356,1),3]
  savings <- savings - 5000
}
savings  


## Let's put this simulation into a function
retirementSimulation <- function(savings,monthlyWithdrawal,monthCount){
  for (i in 1:monthCount){
    savings <- savings + savings*f[sample(1356,1),3]
    savings <- savings - monthlyWithdrawal
  }
  return(savings)
}

## Let's run 5 simulations
for (i in 1:5)
  print(retirementSimulation(10^6,5000,240))

## Let's do 5 more and see if we ever lose money
for (i in 1:5)
  print(retirementSimulation(10^6,5000,240))

## Wow in the 3rd case we managed to run out of money long before age 90
## let's do this a bit more carefully

trial<-1:1000
trials <- data.frame(trial)
trials$run <- 0

for (i in 1:1000){
  trials$run[i] <- retirementSimulation(10^6,5000,240)
}
trials[1:10,]

summary(trials)
## This suggests 75% of the time we have more than $29,000 left after 20 years
## on average we have more than a million dollars and there is a chance
## we could end up with more than 10 million dollars


## Let's compute the probability that we run out of money
loss<-0
for (i in 1:1000){
  if (trials[i,2]<0)
    loss<-loss+1
}
loss

##probability that we run out of money is loss/1000
loss/1000

##23% chance that we run out of money.  Can we increase our odds by
##only removing 4000 per month?
for (i in 1:1000){
  trials$run[i] <- retirementSimulation(10^6,4000,240)
}
loss<-0
for (i in 1:1000){
  if (trials[i,2]<0)
    loss<-loss+1
}
loss
91/1000
##Now we have a 9% chance of running out of money
##financial advisors run these kinds of simulations 
##with various scenarios to see how much you
##should save

##Run a simulation assuming you will retire at 75 with 2 million dollars,
##will live to 100 and need 9,000 per month.  What is the probability
##that you will run out of money?
for (i in 1:1000){
  trials$run[i] <- retirementSimulation(2*(10^6),9000,300)
}
loss<-0
for (i in 1:1000){
  if (trials[i,2]<0)
    loss<-loss+1
}
loss
loss/1000





