# Machine Learning Algorithm Requirements

This document itemizes requirements for machine learning algorithmic models.  These requirements can be included in specifications or test documentation.

Some requirements can be model specific.  Choosing whether to invent a new algorithmic machine learning model or to use an existing one and which one to use comes from:

- the supplied data
- what wants to be known about the data
- measuring algorithm performance metrics.

Some requirements are measurable.  Others are only qualitative.  In particular, there are:

1. Requirements that apply to all models
2. Requirements that apply only to specific models
3. Custom metrics

## 1. Requirements that apply to all models

- What should the algorithm do?
- Output(s)?
    + What are output(s)?
    + Rationale needs (i.e. why outlier, why choice)?
- Input(s)?
    + What are input(s)?
        + size
        + variance
        + bias
        + outliers
        + cleanliness
        + correlation
        + accuracy
        + missing data
- Training
    + time
        * real-time | batch
        * response time limits
    + space 
        * storage limits
        * memory limits
    + concurrency
        * multithreaded vs. single threaded
        * single computer vs. cluster
    + processing: CPU | GPU | TPU
    + network / Internet: online | offline
    + flexibility
    + scalability
- Prediction (runtime) constraints:
    + time
        * real-time | batch
        * response time limits
    + space 
        * storage limits
        * memory limits
    + concurrency
        * multithreaded vs. single threaded
        * single computer vs. cluster
    + processing: CPU | GPU | TPU
    + network / Internet: online | offline
    + flexibility
    + scalability
- Tradeoffs
    + hierarchy of what should be improved and the expense of what else, i.e. prediction time is essential whereas model space is not as essential and training time is even less essential
- Confidence Interval
- Gain and Lift Charts
- Chi Square
- Kolmogorov-Smirnov Chart

## 2. Requirements that apply only to specific models

### Supervised

#### Classification Model

- Bias preference toward false positives or false negatives
- Accuracy
    + Log Loss
- F1 Score, or F score
    + Precision
    + Recall
- Gini Coefficient
- Z-score
    + AUC/ROC
- Confusion Matrix

#### Regression Model

- R-squared
- RMSE
- L^1 RMSE

### Unsupervised

#### Clustering

- Number of desired clusters, or acceptable range of desired clusters

#### Dimensionality Reduction

- Desired reduction in dimensions

## 3. Custom metrics

### Object Detection

- Intersection Over Union ([IOU](https://www.pyimagesearch.com/2016/11/07/intersection-over-union-iou-for-object-detection/))

### Custom model metric

Some models require definition of their own metrics.

## Resources

[11 Important Model Evaluation Techniques Everyone Should Know](https://www.datasciencecentral.com/profiles/blogs/7-important-model-evaluation-error-metrics-everyone-should-know)

[Metrics To Evaluate Machine Learning Algorithms in Python](https://machinelearningmastery.com/metrics-evaluate-machine-learning-algorithms-python)


