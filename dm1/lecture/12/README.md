# Rowan DM1

Lecture 12
8/13/2018

## Agenda

1.	Any Mini-Talks?
2.	I’m almost caught up with the homework.  A couple of shoutouts  for R-bootcamp: Matt Motto nice heatmap. Tim Pearson thanks for the interactive filter (didn’t know about that).  Robert Preuss – see below.  Graham – magic squares.  Several others did lines of best fit and features of ggplot.
3.	Shoutouts for the R-Markdown.  Many did links to websites and images.  Alex showed how footnotes worked and Joe showed how to convert an entire R-Markdown into a Latex document.  Dimitri embedded a simulation which creates an mpeg video. Cool.
4.	Finish Neural Net from Lecture 11 and Sensitivity Analysis
5.	Model.Matrix example
6.	Principal Components Analysis (PCA)



## R - Sensitivity Analysis

## Principal Component Analysis

PCA gives you a weights to show how much of the model is explained by variables in different dimensions.

It uses eignevectors.

Graham schmidt Orthonnormal basis.

### z-Score Normalization

mean is 0  
standard deviation is 1

formula here

### Carnagie Mellon Houses Data

Key to PCA is Covariance Matrix (Z Matrix)

Try to predict median home value of a zip code

sigma 1:1 

how to calc sum

numjber close to 1 implies varibales are colinear

draftsman's plot also shows correlations

negative correlation (llok at lat and long which make a map of california with negative slope)

yi=eiTZ - eigenvectors

R cna complate eigenvectors
eigentvecotrs importeant ins signal porcessing too

we've replace origina 8 variabls with 8 independent variables

eigvne values and eigen vectors explain the variance
typically first may explain 50%, 2nd 25%, 3rd, 4th, 5th less less less

example could go from 100 variables to 60 could process faster

how may principal componants do you need
depends on accuracy you need

R screeplot()
stop at number of components where line gets flat

hPCA<-princomp(houes)
hPCA$Loadins

User Defined composists
- make your own based on how things are coorelted
- will not work as well as PCA eignevectors - but it can be done

### R noteabook

z2 normalization ?????????? normalize first

pca per column
build components yourself from loadings

musst do same for train/test ???????????????? all at once

is your model being over trained

matrix multiplication to get each pca?

# could try to change target values to log of variable

no improvement
throw out nerual network
try regression model
53 percent error

make your own PCA

all these models are b

Final on Monday
Take home final on Wednesday
Won't need to do a review

Take home final handed out Wednesday

1/2  review

# Wed

Market basket analysis
i.e. buy PB&J prob buy bread too

