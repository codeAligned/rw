Agenda 9/12/2018

1.	Any questions about anything?
2.	SVMs
3.	Breast Cancer Set R
4.	Non-linear data points R
5.	Activation Functions – A nice mini-talk by Sam Haley
6.	Jason Snouffer’s Project from last Spring – Trump Tweets
7.	Critique of Jason’s project

## 1. Any questions about anything?


## 2. SVMs

See notes.  Seperate data with hyperplane (line) with greatest distance from both sets.

## 3. Breast Cancer Set R

breastCancer2.r

library(e1071) ## SVM

as.factor(V2)~V3...

to predict V2

svm_tune tuning algorithm - from stack exchange


## 4. Non-linear data points R

regressionTests.r

added neural networks to show overfitting
SVMs cannot overfit

R:
lm() add a line of best fit

can use line as base line

SVM fits a curve to th points
because it is working in much higher dimensions

neural net overfit - 
where there are sharp corners to fitted points there is no derative

svm gives more of a spline

## 5. Activation Functions – A nice mini-talk by Sam Haley

Neural Network Activation Functions

activation functions about 8

wikipedia page on neural network training

gradients are partial derivatives - can help find direction and slope of greatest change

backpropagation - things go through activation function

how back prop handles gradients

### binary step function: gradient is zero so back-propagation does't learn anything vs. sigmoid which has slope

if binary step works you probably could use linear regression

if sigmoid slope is step - change weight a lot, if flat don't change

### linear function

gradient is constant (act like multiple regression)

### sigmoid

### ReLU functoin

Graham: could use it to pair down and remove dead neurons from neural net

most widely used?

### Leaky ReLu function

addressees the issue of dead neurons in ReLU

### Softmax Function

type of sigmoid function

commonly used in output layer

### choosing
typical ReLU for hidden layers, Softmax for output layer

### use neural network to determine how many hidden layers a neural net needs

stacked models using output of other models

## 6. Jason Snouffer’s Project from last Spring – Trump Tweets

visuals matter



## 7. Critique of Jason’s project


## Ron Project Idea

http://www.aishub.net/
