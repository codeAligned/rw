# Lecture 5 Classification and R Stats

classification can come from clustering

can run R and python in jupyter notebook

# R Stats

need to code your own mode,
3 ways

hist() - histogram

automatically choose breaks - you can override it

R has box plots

box and whisker plot: how does R define outliers?

define
mean
standard deviation
upper / lower quartile

picture: what is r suared
want high numbers 0.9 ish
r squared is the correlations coefficient

R-squared is a statistical measure of how close the data are to the fitted regression line. It is also known as the coefficient of determination, or the coefficient of multiple determination for multiple regression. 0% indicates that the model explains none of the variability of the response data around its mean

R:
<-
=
$

# Linear regression

# Multiple regression

- typically used incorretly
measures
linearity
indepences
normality
constance variance

Linear combination of variables

SVM alternately could give 20 dimensions, lines in higher dimensions can look like curves in lower dimensions

#### Look for correlations between features

pairs() plot : "draftsmans plot"


round(cor(data4)) - another w

watch for int trunction in cor results

~ means predicting

resultx ~ featA + featB + featC

What mean predict mulitple resuts?

plot(regmodel)

Residuals vs fitted - no systematic independence
QQ plot look for lineariety

how determine which features are important

maybe removing outliers could help build a better model

build a model, get it done
could imporove if needed

- step wise calcualtion (multi-factor)
- remove outliesr

## Decision Trees
Used for yes/no questions
    is y a terrorist?
    is transation fradulent?
    will y buy a computer/house/etc?

Advantages/Disadvantages
- can put in to production with if/then statements in C++ or whatever

Disadvanates
- first catagorize linear data into catetories before using decision tree 
- susceptible to over fitting (pruning can help)
- correlations are ignored
- doesn't handle missing data well

Makes a human readable model
- rational built into model

Example:
will i have a long comute

Decision trees are built on traning dta
most popular models are:
1. CART (classification adn Regression Tree)
2. C5.0 (formerly C4.5 formerly ID3)

Both are one-pass, recursive, greedy

Decision trees are greedy, can get stuck in local min / max

Greedy algorthim: takes the biggest bite first
can get stuck in a local maximum
ex/ shortest path graphing algoritm

ex/ spanning tree is also a greedy algorithm

greedy like '20 quetions'
- with a 5 year old: is mom? is dad?
- sophisticated: dead or alive? bigger than breadbox?

Finds "best" attribute - lop off most data first
Cart - max fi is best
C5 - entropy is best

Decision tree pseudocode
key is how we define "best

algrotim stops:
run out of data
run out examples
out of attributes to test

example: Training gdata to predict creidt risk

conditional probabliy: probility when you know somehting

flip 2 coins: prob is 25%
know first 1 head: prop 2nd is head is 50%

trees in cart are all binary

home value is asssets in slide


