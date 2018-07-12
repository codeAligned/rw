
getwd()

setwd('C:\\Users\\abrei\\Desktop\\week2')
getwd()

## Read in a file
mydata=read.csv("cars1bad.csv",header=TRUE,sep=",")
dim(mydata)
## 262 rows by 8 columns
## let's look at the first few rows
head(mydata)

#let's get some summary data via aggregate
aggregate(mydata$cylinders,list(cyl=mydata$cylinders,brand=mydata$brand),length)


# we see a couple of problems. There is one entry in France that should be mapped to Europe 
# and one USA that should be mapped to US.
# Also there is an NA for an entry.Let's see if we can figure out what value should be there.
  
# First let's replace France. with Europe.
which(mydata$brand=='France.')
mydata$brand[1]
#there seems to be a leading space
which(mydata$brand==' France.')
#we could just replace mydata$brand[2] but we can be slick
mydata$brand[which(mydata$brand==' France.')]<-' Europe.'
mydata$brand[which(mydata$brand==' USA.')]<-' US.'

aggregate(mydata$cylinders,list(cyl=mydata$cylinders,brand=mydata$brand),length)

#Now let's deal with the NA
which(is.na(mydata$cylinders))
#that didn't work
mode(mydata$cylinders)
mydata$cylinders<- as.integer(as.character(mydata$cylinders))
which(is.na(mydata$cylinders))
mydata[244,]
#400 cubic inches is a V8 for sure.
mydata$cylinders[244]<-8
aggregate(mydata$cylinders,list(cyl=mydata$cylinders,brand=mydata$brand),length)

# this suggests that only US manufacturers had 8 cylinder motors in the 70s and 80s.

# Next we would like to look at the mean of each column, but we can't take a mean 
# of 'brand' so we will have to do something to remove that column from the mean.

# we saw before that we can get a subset with c()
vars <- c("MPG","cylinders","cubicInches","horsepower","weightLbs","timeToSixty")
newData <-mydata[vars]
head(newData)

aggregate(newData,list(mydata$brand,mydata$cylinders),mean)

# This suggests the US had the weakest 6 cylinder engines and some very heavy cars
# let's do some sorting
  

sort1 <- mydata[order(mydata$MPG), ]
head(sort1)
tail(sort1)

# to get the best mileage we need a descending sort which uses '-'
sort2 <- mydata[order(-mydata$MPG), ]
head(sort2)

sort3 <- mydata[order(mydata$timeToSixty),]
head(sort3)
# that first record looks wrong.  How's a 3500 pound 4 cylinder going to go from
# 0 to 60 in 4 seconds?

#let's investigate further with a scatterplot
plot(mydata$MPG,mydata$timeToSixty,main="scatter1",xlab="Miles Per Gallon",ylab="zero to sixty (seconds)")

# pretty clearly an outlier
# to double check, we will compare our potential outlier to other 4 cylinder cars
smallData <- subset(mydata,cylinders==4,)
dim(smallData)

plot(smallData$MPG,smallData$timeToSixty,main="scatter2",xlab="Miles Per Gallon",ylab="zero to sixty (seconds)")


#let's do a histogram now
counts <- table(smallData$timeToSixty)
counts
barplot(counts,main="zero to sixty distribution",xlab="# seconds",ylab="# cars")

# A useful tool is z-score standardization
# sometimes we will want to replace a column with its z-score transformation
# for our data analysis.
# other times we will want to use it to locate potential outliers
# a z-score much greater than 3 or less than -3 is almost certainly an outlier
# R makes it easy to calculate a mean and standard deviation of a column
mTime <- mean(smallData$timeToSixty)
mSD <- sd(smallData$timeToSixty)
mTime
mSD
# Let's insert z-scores as a column
smallData$timeToSixtyZscore <- round((smallData$timeToSixty - mTime)/mSD,1)
sort3 <- smallData[order(smallData$timeToSixtyZscore), ]
head(sort3)
tail(sort3)

counts <- table(smallData$timeToSixtyZscore)
barplot(counts,main="zero to sixty distribution2",xlab="# seconds zscore",ylab="# cars")


#to deal with outliers, we can either try to estimate a proper value
#we can ask the data provider for a better value, or we can delete
#the row.  Since we have plenty of good data, we will remove this
#record entirely
newData <- subset(mydata,timeToSixty>4,)
dim(newData)

#Another useful transformation is Min-Max normalization
#Once a column is transformed the Min value will be 0, the max will be 1, and
#average values will be around 0.5
myMin = min(newData$timeToSixty)
myMax = max(newData$timeToSixty)
newData$timeMM <- round((newData$timeToSixty - myMin)/(myMax-myMin),1)
head(newData)


sort4 <- newData[order(newData$timeToSixty), ]
head(sort4)
tail(sort4)


#we can now write our cleaned up table back to a csv file
#first check to see if we are in the correct directory
getwd()
write.csv(newData, file = "carsFix2.csv",row.names=FALSE)


#Exercise: Create a a subset data set consisting of the 6 cylinder cars called 
#'sixSubset'

