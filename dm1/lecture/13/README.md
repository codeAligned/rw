# Lecture 13

1.	Leaderboard.  If I missed you or shortchanged you let me know.
2.	Any Minitalks?  Add to leaderboard
3.	Any questions about anything?  
4.	Logistic Regression a, R, b 
5.	Model Evaluation
6.	Take Home Final.  Already posted.  It will magically appear in Canvas at 8pm tonight.  Submit before class on Monday August 20.
7.	8/20: Market Basket Analysis; Any remaining mini-talks

# Minitalks

Informs. $150/yr

3 conferences per year

has a philadelphia chapter

Journals: decision analysis, etc

competititions

----------
# Hydroponics 

rhl

with neural networks via java8 predicates and lambda expressions for activation functions
and linear regression

statistical analysis independent facotrs

co2 / sensor
heat
light
water
humidity

basal tomatoes grass plants

isolated biomes

measure success: human feedback
global warmer

# seaborn - uses matplotlib
seaborn.pydata.org

example: facet 'ridge plot'

FIFA 17 players: speed, acceleration, etc

ex/ age vs. speed

line plot no

linear regression

peak speed aroudn 25, two regressions

bar plotsj: speed and accelerations averaged togethre

dips in speed for substitues and reserve players

Numbers #1 and #10 best

violin plot

# rapid miner 

instead or with python or r

like media matrix for data science

features are called attributes

# Weka

less polished rapid miner

open source GUI based data mining

quick and easy way to see 

min max missing distinc mean

what dies data look like at a high level?

replace data with filters / dummies

built in classification an clustring

alternative:
bigml.com
rapidminer

can traing/test/cross validate

XKCE R Library - stick figures on your drawings

# Breitzman

## 4.	Logistic Regression a, R, b 

Faster than a neural network

good at yes/no questions

logistic sigmoid function does a better job than straight line

want to fit the logistic curve

usually use maximum likelihoot estimation

could use newton's method with M.L.E.

Wald stists can help determine accuracy

### R

logisticR.doc

stata data from UCLA (*.dta)

stata is expensive statistics package (R is free)

R import library(foreign)

can import excel files

GRE score, GPA, rank

logistic regression doesn't like continuous variables

create "low, medium, high" classification class

ggplot with multiple variabls at once

gps vs school ranck vs. high low med score

something missing in the data?

jister spreads out points so they don't look like thye are on top of each other

can get a better view with jittrer
scatter plot with dots on top

how do you do jittre in python

lm linear model

glm logistic regression model

change to gre2 to get better results

logistic regression worked better then liner regression

---------
census

min/max norme

model matrix to get dummies

neural net for comparison

does logisitc regression require categorical data?

predicts categorical data
may not require categorical data

R logistic regression

shows quartiles

create model

then call predict on dataset

85% correct 
with 0.5 thresshold

super fast compared to neural net

could to an ensemble

ensemble - want an odd # 
popular erro
or give one with less error more weight

--
after r

logistic cureve
plot of actual data
in excel

logistic fit will bend curve

except

what is x axis in plot?

sorted by ascending/descending guess?

x axis samples?

MLE MLE MLE

will still have some false negatives and false positivies

can sometimes get a better result by chossing a cutoff 
other than 0.5

neural networks take longer to train
run slower
and are generally more accurate than logistic regression

## Evaluating models

Methods other than ROC curves

more than just looking at accuracy

can depend on whether your are trying to favor
false negatives vs false positives

### Gain Chart

100% is 100% of 50% on y axis

2200 people
706 died

not getting gain chart

Gain Chart
Lift Chart
Confusion matrix - predicted vs actual


Ereor rate  false / all

F1 score
 balances precision and recall

 F1 usutally used in a contest to measure models

 can plot precsion vs. recall of your model (red on chart)
wnat f1 score at peak performance of model









## 5.	Model Evaluation
## 6.	Take Home Final.  Already posted.  It will magically appear in Canvas at 8pm tonight.  Submit before class on Monday August 20.
## 7.	8/20: Market Basket Analysis; Any remaining mini-talks
