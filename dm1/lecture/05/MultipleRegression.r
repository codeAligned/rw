## Breitzman multiple regression.  7/18/2018

##setwd("C:/Users/abrei/Desktop/DMweek5/cereals")
mydata=read.csv("cereals.CSV",header=TRUE,sep=",")
dim(mydata)

vars<-c("Calories","Protein","Fat","Sodium","Fiber","Carbo","Sugars","Potass","Vitamins","Rating")
data4<-mydata[vars]
head(data4)

#the pairs command gives a 'draftmans'plot
pairs(data4)

#Note potassium and fiber are highly correlated
#we'll learn sophisticated ways of dealing with colinearity like 
#principal components analysis, but for now we'll just delete potassium

vars<-c("Calories","Protein","Fat","Sodium","Fiber","Carbo","Sugars","Vitamins","Rating")
data4<-mydata[vars]
pairs(data4)


#We can also use the cor command to check for correlations
round(cor(data4),4)
#as expected, nothing else is colinear
#as expected, calories, fat, sodium, sugars negatively correlated with rating
#as expected, protein, fiber positively correlated
#vitamins negatively correlated (a surprise) but barely correlated
#carbo barely correlated with rating
  

#build a regression model
regmodel=lm(data4$Rating~data4$Calories+data4$Sugars+data4$Protein+data4$Fat+data4$Fiber+ data4$Carbo+data4$Vitamins)
plot(regmodel)

#Normal Q-Q: This graph shows no systematic deviations from a straight 
#line and thus normality assumption is ok
  
  
#The plot of residuals versus fits is examined for discernible 
#patterns. if obvious curvature in the scatterplot is found then 
#the linearity assumption is violated. if the vertical spread in 
#the points is systematically non-uniform, then constant variance 
#assumption is violated

#the last assumption is independence.  We would not expect the rating 
#of one cereal to affect another so independence is reasonable.
  
summary(regmodel)


# R-square of .92 is good; standard error of 4.22 is ok
# Probabilities all are near 0, except carbo.  Let's remove it
regmodel=lm(data4$Rating~data4$Calories+data4$Sugars+data4$Protein+data4$Fat+data4$Fiber+ data4$Vitamins)
summary(regmodel)


# Our model for predicted rating is 
# 59.99 -.10942Calories-1.54939Sugars+2.61499Protein-3.39446Fat
# +2.18211Fiber-.09444Vitamins
# If we were to take out the one very high rating we could probably 
# get an even better model for predicting ratings between 40 and 80
Cal<-data4$Calories  
Sugars<-data4$Sugars
Prot<-data4$Protein
Fat<-data4$Fat
Fiber<-data4$Fiber
Vitamins<-data4$Vitamins
data4$predict<-59.99 -.10942*Cal-1.54939*Sugars+2.61499*Prot-3.39446*Fat+2.18211*Fiber-.09444*Vitamins
data4$predictErr<-data4$Rating-data4$predict
vars<-c("Rating","predict","predictErr")
data5<-data4[vars]
head(data5)
tail(data5)
sort1<-data5[order(-data5$predictErr),]
head(sort1)
tail(sort1)
hist(data5$predictErr)

dim(data5)
dim(data5[which(abs(data5$predictErr)<10),])
54/76
# 71% of predictions are less than 10 off
# We probably could have gotten a better prediction by removing
# the one very highly rated cereal

# This is not bad. Multiple regression is probably the least
# sophisticated model we will use.  We'll get better predictions
# when we learn methods like neural networks, decision trees etc.