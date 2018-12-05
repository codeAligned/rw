## Breitzman 4/23/17
## Code modified from Ryan Smith's code for running multiple models on Wine data
import sys
## let's see what we're running
print(sys.version)
## Using anaconda version of Python 3.6
## We'll have to modify Ryan's code a little because he is 
## using Python 2.7

import pandas
import matplotlib.pyplot as plt
import numpy as np
from sklearn import model_selection
from sklearn.ensemble import AdaBoostClassifier, RandomForestClassifier, ExtraTreesClassifier, VotingClassifier, BaggingClassifier
from sklearn.linear_model import LogisticRegression, SGDClassifier, PassiveAggressiveClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC
from sklearn.model_selection import train_test_split
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.gaussian_process import GaussianProcessClassifier
from sklearn.neural_network import MLPClassifier
from sklearn.preprocessing import LabelBinarizer, StandardScaler, MinMaxScaler
from sklearn.metrics import confusion_matrix
from imblearn.under_sampling import EditedNearestNeighbours
from imblearn.combine import SMOTEENN, SMOTETomek
from imblearn.over_sampling import RandomOverSampler, ADASYN, SMOTE



# Constants
SCORING_ARG = 'accuracy'  # the de-facto classification metric. not for regression.
SEED = 20 # set the seed to get reproducible results
np.random.seed(SEED)
K_FOLD_ARG = 5

# Load dataset using Pandas. We can inspect the data frame using Rodeo
# We'll use Matt's cleaned up kidney file.
# It matches tony's but has better headings
# it matches Cole and Chris except for 2 columns
# don't forget to switch direction of slashes in path
dataframe = pandas.read_csv("C:/Users/User/Dropbox/Rowan/DM2/Lecture12/matt_ckd_data_clean2.csv")

#get dimension
dim=dataframe.shape
print(dim)
## 400 rows; 25 columns

dataframe.columns

## get non-class variable names
var_names = [col for col in dataframe.columns if not col.startswith('class')]
var_names

# Min max normalization from Ryan
dataframe[var_names] = MinMaxScaler().fit_transform(dataframe[var_names].as_matrix())

# Get the variables in our model and the predictor
# This section is similar in spirit to developing the formula for R
# var_names stores everything but the predictor
# var_names = [col for col in dataframe.columns if not col.startswith('quality')]
vars_in_model = dataframe[var_names].values   # aka X in sklearn terms
predictor = dataframe['class'].values       # aka Y in sklearn terms

# Look at a histogram. 
plt.hist(dataframe['class'].values)
# Not terribly unbalanced. 150 class 0; 250 class 1


# Do over-sampling and look at the results.
ee = RandomOverSampler()
x_resample, y_resample = ee.fit_sample(vars_in_model, predictor)
plt.hist(y_resample)

# Separate into testing/training. This isn't needed for k-fold, 
# but it is if we want a confusion matrix
x_train, x_test, y_train, y_test = train_test_split(x_resample, y_resample)

# Create several models, we will test them all. 
# An advantage of using sklearn here is the unified interface for these models, whereas R is specific to each package
# This means we can try all of these models in one for loop, do k-fold, and see which one does the best
models = list()
models.append(('BAG', BaggingClassifier(base_estimator = DecisionTreeClassifier(), n_estimators=500)))
models.append(('LR', LogisticRegression(class_weight='balanced')))
models.append(('KNN', KNeighborsClassifier(n_neighbors=1, weights="distance")))
models.append(('CART', DecisionTreeClassifier(criterion='entropy')))
models.append(('SVM', SVC(kernel='sigmoid')))
models.append(('ADA', AdaBoostClassifier(base_estimator= DecisionTreeClassifier(), n_estimators=400)))
models.append(('GDB', GradientBoostingClassifier(n_estimators=200)))
models.append(('RF', RandomForestClassifier(n_estimators=100, n_jobs=-1)))
models.append(('NN', MLPClassifier(alpha=1, hidden_layer_sizes=(7, 7), max_iter = 2000)))

# Evaluate each model. Get the mean and standard deviation for the k-fold cross validation for accuracy
results = list()

# Loop through each model, do k-fold, and print the results.
for name, classifier in models:
	kfold = model_selection.StratifiedKFold(n_splits=K_FOLD_ARG, random_state=SEED)
	cv_results = model_selection.cross_val_score(classifier, x_resample, y_resample, cv=kfold, scoring=SCORING_ARG)
	results.append((name, cv_results)) # append the tuple of (name, results) to results list
	msg = "%s: %f (%f)" % (name, cv_results.mean(), cv_results.std())
	print(msg)
	y_pred = classifier.fit(x_train, y_train).predict(x_test)
	# Print a confusion matrix using pandas.
	print(pandas.crosstab(y_test, y_pred, rownames=['Actual'], colnames=['Predicted'], margins=True))

# Now let's try voting
voting = VotingClassifier(estimators=models, voting='hard') # Majority rules classifier
kfold = model_selection.StratifiedKFold(n_splits=K_FOLD_ARG, random_state=SEED)
cv_results = model_selection.cross_val_score(voting, x_resample, y_resample, cv=kfold, scoring=SCORING_ARG)
msg = "%s: %f (%f)" % ("VOTING", cv_results.mean(), cv_results.std())
print(msg)
y_pred = voting.fit(x_train, y_train).predict(x_test)
print(pandas.crosstab(y_test, y_pred, rownames=['Actual'], colnames=['Predicted'], margins=True))

# Compare classifiers
fig = plt.figure(figsize=(10, 10))
fig.suptitle('Classifier Comparison')
ax = fig.add_subplot(111)
plt.boxplot([result for name, result in results])
ax.set_xticklabels([name for name, result in results])
plt.show()

