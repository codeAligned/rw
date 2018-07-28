# Lecture 07 Class Notes 20180725

1.	Any mini-talks?
2.	Homework 1 cool results
3.	Trees in Python Sci Kit Learn
4.	Midterm review
5.	Rodeo demo if time

## 1.	Any mini-talks?

### PyQt5 python 3.6, Pyqt4 python 2.7 - make a dialog box gui

### Interactive R Markdown using Shiny

Interactive rmd file using "Shiny".
Need shiny on webservrer. so deploy to shinyapps.io
install.packages("rsconnect")
locally you just knit and it will auto install shinny for you

allows you to visualize your data without re-knitting your document

https://alexweberdatamining.shinny.io?

## 2.	Homework 1 cool results

various, et. al.  liked use of api directly from requests.

## 3.	Trees in Python Sci Kit Learn

scikitLearnTreeExamplepy.html

scikitleran does not like non-numeric values for catetories
R can work with named categories

to classify subclasses create new categoiry with 0 or 1 for participation

don't make too many categoires
can summarize, i.e. country us or not us

use pd.get_dummmies - dummie variables are 0 or 1
which can create too manu variables, i.e. sex_male, sex_female 
a person knows these are opposite each other
and could be reducted to 1 variable

used graphviz library to view tree

results not as good as R (82% vs. 85% with R)

coul dremove extra variables
may get a better result

SQLite limit: 147TB

R, pandas, 

pandas 100million rows - limited to RAM on PC

## 4.	Midterm review

- remember the theory

- Memorize data mining circle picture - know it is a process, compate to cmmm

- Kmeans clustring - pick a k ahead of time
all use a distance measure
iterative process looking at differece of disance

needs similarity or dissimalrity matrix

cosine disntace

kmeans clustring algorithm

heirarchical clusttering
- don't have to pick # clusters ahead of time
end up with dendrogram

understand linkage
- single link
- complete link
- averagelink

### K means classification
- is he a terrorist
- is she a good credit risk

example 3 clases: hot warm cold
a new point appears, which class does it below theer?

choose k closeset centoirs
then compare within cnentroid

Mulitple Data Types

- Term Data, Frequency Data, Vector Data
- Asymmetric binary data
- Synwtric Binary data
- categorical (nominal data)
- ordinal data (warm/hot/cold) to min/max/norm spread

slide 19 for homework

## Clustering v. classification
bewar of over fie

## Basic stats

## classification, linear regression

** models are for interpolation, not extrapolation **
ex: model of child growth from 2 to 18 not good a predicting height of an 80 year old

## Gauassian Classifiction?


## Decision Trees

y/n - CART and C5

C5 could to yes no maybe

CART best probablie
C5 best based on entropy

don't really need to know card formulas

look at excel CART and C5 spreadsheets - basic idea of how they work

slide 34 compute entropies

c5 elminites columes
cart eliminates rows

more big picture questions

## 5.	Rodeo demo if time

