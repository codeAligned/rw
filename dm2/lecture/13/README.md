Agenda 11/14/18

1.	No class next week so plenty of time to work on your projects and a HW assignment.  HW due 11/29/18.  Easy but painful.  But a good exercise in R or your tool of choice.  You can work with someone else.  Download the Chronic Kidney Disease file from http://archive.ics.uci.edu/ml/machine-learning-databases/00336/

It needs a fair amount of cleanup which will give you some practice.  

a.	Open in text editor and remove all the intro nonsense (save it somewhere though so you know what the column headings etc. should be)
b.	Add column headings
c.	Make everything numeric.  E.g.  ckd=1, nonckd=0, Normal=0, Abnormal=1,  yes=1, no=0, etc.
d.	Change missing data (currently == ?) to average values for class.  For example if average BP of ckd is 100 then ? becomes 100, if it’s 80 for nonckd then assign to 80.  (for the 1 and 0 cases choose the majority value) for that class
e.	Write out file as a .csv file.
f.	Run a bagging example and a boosting example and see which works best in predicting ckd=1
g.	Save your new csv file and submit.
h.	Note I gave this HW assignment a couple of years ago and almost no 2 files agreed.  I then cleaned it myself and it agreed with Matt Long.  I still don’t know if Matt and I were right or if someone else was more right.  It will be interesting to see what people come up with.
2.	Calendar
11/14/2018 – see below
11/21/2018 – No class
11/28/2018 – TBD
12/5/2018 – TBD/Short first half. Second half devoted to polishing people’s presentations
12/12/2018 – Class cancelled.  Big Data conference.  Finish up your presentations
12/19/2018 – No final.  Presentations. ~10 minutes each.
3.	Anaconda madness
4.	Link Analysis
5.	Class dismissed but I’ll stick around for any project questions 

# Sensitivity Analysis

- Dimitri: Neural Net
- Tim: KernLab
- Ron: SALib
- Dan: build model on all, then build and delete inputs one at a time - see what effects it the most
- : similar to bagging - wat set is most important
- Joe: set inputs to 0 or 1 and measure swing in existing built model, and measure increase in error rate
- greg: cool visual size of dot sensitivey
- lee: caret package varimp

# Multidimensional scaling

- new york, orlando, seattle distance

add datapoints keep distances between all points 

dimensions from 2 dimensions to 50 dimensions or whatever

like kernel function in SVM

some f(x) lives in lower dimension space to preserve distances

example: back to cereal example in DM1

and put it on a map

similarity matrix 74x74 with 1 on diagonal

then call sim2dist

build heirarchical cluster

dendogram shows distances

dendogram with names

see them all on a multidimensional map

MDS scalding in R

fit <- cmd_scale(d, eig = TRUE, k = 2)

PCA - principle components become x and y

MDA x and y that preserve all the distances

11 dimensions to 2?

familiar example

distances between cities

mds good for exploratory data analysis - find outliers

wired map of science

# projects

missing older data - drop it?

old data - before electronic - typically not complete

NIH inflation modifier

