# Lecture 11

8/8/2018

Last class and Exam 8/20

Agenda:

1. Minitalks
2. Neural networks

dm2 9/5 -> 12/21


## 1. Homework: Titanic

Minitalks.

# Add to Memoization to Recursion

Try it at home.

# Neural Nets

invented in 1950s
not effective
1982 john hopfield back propagation - started rennisance

review learning rate

read forbes article

Next
- repeat qsuare root mode in R
do census example in excel

set bias (1) weights to zero to start?
may give better error
even though cannot set every weight same way - may bias weights can be 1 to start


neural nets are good at interpolating between points
not so good at extrapolating outside range of trained data

number of hidden nodes guess rule of thumb 2/3 number of inputs + number of outputs
have to experiment with different models to see what works best

once you have weights you can implement the nerual net



## Simple neural net
nerual net with 1 weights

input layer | hidden layer | output layr

typ 3/2 hid   typ 3/2 out     typ 1 per output

CNN - compute cross products well
i.e. weights x
espeically with graphics processor


- input layer as many nodes as attributes
- attributes must be numeric; shoudlb e between 0 and 1
- can have multiple hidden layers, but usually one si sufficents
- hidden laer may have any number of noes, trial and error
- too many nodes can lead to overfitting

random to start
output has huge error
back propagation reduced error
after much training weights will get to something that is predictive
training can tale a long time

## Backpropabation

computes calc 3 deriviate (gradient)
to effective adujst back weights to get less error

scikit learn neural network is perceptron library
epochs - each time the training set goes through

minmize SSE sum of square errors

can take small steps (don't over shoot)
can use directional derivitives to take bigger steps


Done?
1. run out of testing data
2. stop when error no longer improsve
3. stop when error hits a threshold

# neuralNetEx1.xls

backpropagation - each cell get its weight share of the error

calculate weights below

store them tot the far right

right a macro to retest with new weights


# stop training?

when your error rate on training data is similar to error rate on test data

# use neural net to find square root

i.e. square root net
nnex2squareroot.xls


