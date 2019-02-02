Homework 7

Due 11/29/18.  Easy but painful.  But a good exercise in R or your tool of choice.  You can work with someone else.  

Download the Chronic Kidney Disease file from [uci](http://archive.ics.uci.edu/ml/machine-learning-databases/00336).
Description [here](https://archive.ics.uci.edu/ml/datasets/Chronic_Kidney_Disease).

Use 7zip to unzip the rar file.

It needs a fair amount of cleanup which will give you some practice.  

a.	Open in text editor and remove all the intro nonsense (save it somewhere though so you know what the column headings etc. should be)
b.	Add column headings
c.	Make everything numeric.  E.g.  ckd=1, nonckd=0, Normal=0, Abnormal=1,  yes=1, no=0, etc.
d.	Change missing data (currently == ?) to average values for class.  For example if average BP of ckd is 100 then ? becomes 100, if it’s 80 for nonckd then assign to 80.  (for the 1 and 0 cases choose the majority value) for that class
e.	Write out file as a .csv file.
f.	Run a bagging example and a boosting example and see which works best in predicting ckd=1
g.	Save your new csv file and submit.
h.	Note I gave this HW assignment a couple of years ago and almost no 2 files agreed.  I then cleaned it myself and it agreed with Matt Long.  I still don’t know if Matt and I were right or if someone else was more right.  It will be interesting to see what people come up with.

