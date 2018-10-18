# HW 2 Sensitivity and Random Forests 

Ron Neely, Rowan Data Mining 2
Due 2018.09.27, Assigned 2019.09.19

CAN Plan:

## Concept 

HW  Remember Sensitivity Analysis from DM1?  Essentially we make an average vector which is the mean of each variable in the data file.  We then compute the output of the average vector with each variable ranging from 0 to 1 and see what the difference is.  (In R,  sapply(vector,mean)  might be helpful). 

1. Do a sensitivity analysis on the Neural network results from the breast cancer file and see which variables are the most important.  How do these compare with the Random Forest results?
2. Repeat for the SVM in the breast cancer file.  (Note you can steal my existing files for implementing the NN and SVM on the breast cancer files (see week 1 and 2 content)). You may want to switch back to a non-classification result (I.e. remove the as.factor( ) from the formula to determine sensitivity).  How do these compare with the results from part a
3. Remember to get the 10th point ask and answer a challenge problem that is at least tangentially connected with this HW

## Now

Don't know:

- sensitivity Analysis from DM1 (suspect monte carlo lecture)
- how a mean can be a vector
- R

Have:

- kfold_nn_hw.ipynb example of breast cancer in Python
- Identified SALib as python library for sensitivity analysis
- Will Usher lecture on SALib
- my metis project used random forest to identify top features

## Action

- _ watch SALib lecture + take notes
- _ review Metis project on extracting top features with random forests
- _ create sensitivity_bc.ipynb w/ goals and challenge problem
- _ complete
- _ review
- _ turn in via canvas

