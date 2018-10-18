# Lecture 7

2018.10.17

## Ensemble Methods

### Boosting

### Bagging

### Majority Voting

ensemble can be better

### Correlations

if all models in voting are correlated could end up with worse results

if models are uncorrelated and all models are > 0.5 and ensemble will typically lead to better results

### Weighted voting

give classifiers with higher accuracy more weight

### Averaging Models

result is typically better

kind of like SVM finding model with most "support"

### Model "stacking"

can stack models

i.e. neural netowrk with 10 classifications

use output of all the classifications to train a new neural net

typical logistic regression model

### typical near end of kaggle contest

a few get together to at the end to stack their models together 

stacking won the nextflix prize

### Mixture of experts

example: wine homework

## next week

- more ensemble
- 1 v 1 models a d1 v
- that will give us another winde dadta set
- midterm next week

# Review

change all text to black

## K-folds

- k different testing sets
- k differet testing sets
- want each fold to be comparable
- if one of the folds is off - something is funny

## Neural nets Rules of thumb

- if linear seperable - no hidden nodes are needed (linear regression)
- 

## SVM takeaways

- usually accurate
- but time consuming

## Randeom Foresets

## Nearest Neighbors

Lazy learner - because do nothing with training data

## Boosting

Weak learners, decision stumps

one iteration - what it got wrong
try and get them right (decrease what it got right)


## SMOTE/Oversamling/Undersampling

create new data similar to old data

*Duplicating* data, probably doesn't work for SVM or decision trees and might lead to overfitting in neural nets - therefore use SMOTE to make more data for neural nets


## more conceptuual

more conceptual

manually implement algorithms


## project milestone

1 page proposal

get collecting data!!!

1 page proposal by following sunday


