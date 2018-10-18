# Lecture 6 20181010

exam on 11/24
no class before thanksgiving


## ROC curve

TPR vs FPR

AOC area under curve - want closer to 1.0

smote - create

can create cost function

ex/ 1 terrorst i 20 million
duplicate 1 terrorist record 20 million times would cause an overfit

## breastCancerROC.docss

library(pROC)

- NN in green
- SVM blue
- random red

offset lables

TP vs. FN

- why does specificity axis on picture have 1.0 on left and 0.0 on right

## SMOTE - synthetic minority over-sampling technique

use for unbalanced data sets

sparse positives: i.e. terrorist, business failure, credit card fraud

FFT paper - 15000 
smote paper 4223 cidation

example: wine, only 3 quality 9 windows, but 1700+ qulity

### prev approches

1. increase weights of niries class
2. ...oversample?

Dual picture in 2d shows blue smote generated data points.

Binary input - assume they exist in a convex space
keep all they agree on the same
randomize the rest

#### Pseudocode slide

n would be number of data points you already have

k is number to multiply by

- there could be a mistake on the pseudo code slide

### convex hull

want smote predictied to be closer to hull

smote did better than naieve bayes

### phoneme results

elana project and sound

3800 vs 1500end up with 3800 each

### oil slide


in the end ROSEslick prrose cost was more than breitzman cassediction



ROSE - Random Oversampling Examples

## KNearest neighbors real world exmple

Lecture6c-KNNexamples.ppt

41 oil slics vs 896 non oil slicks

C4.5

## breastCancerSMOTE.r

ROSE package for creating SMOTE in R

heavily weidth Cost function on False Negatives becuase we do not want them

cost would be more if FN

we are minimizing cost function when training

find 10 closest points

malignant was under represented

## we need 103 1's, 176 of them


## cosine distance???

Tony's code takes random points in class to generate

whereas smote code takes closest vectors to other vectors

** convex space **  nerual nets may fit to convex space, whereas k means less likely to do so

SMOTE must use same distance function as your model

i.e. kmeans uses dist f(x) smote should use same

in the end ROSE cost was more than breitzman cass

ROSE - Random Oversampling Examples

## KNearest neighbors real world exmple

Lecture6c-KNNexamples.ppt

use geohashing of tweets

map lat and long to nearest zip code


## HW - kaggle contest

99%
