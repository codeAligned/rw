# Lecture 14
20180820

# Dimitiri

Minitalk on animation in R.

# Questions

What is x axis on sigmoid chart?

samlple number sorted in order from lowest to highest

or a represetnations of n dimentions of indexpendt features in 2d

## Gain chart

Want gain to be well above random (curve above y = x)

sort so highest results go first

broken in to deciles

## Lift chart

Your percent good vs random good

ex/ model of people that might buy an iPad

at what point do you get diminishing returns?

## Market basket analysis

Which items are often bough togethre?

a.k.a. affininity analysis

examples

--

14 things people bought from a farm market

put data in a tabular form with dummy variables

Aprori algorigm

2 measuer for a and b
support = transations containing both a and b / total transations

confidence transations containting both and an b  / transations containgin A

buy asparagu and beans

5/14 confidence have both out of 14 records

5/6 support

dimesion is enemy
can use pair

A,B => C

peanut butter, jelly => bread

could also want to show

asperagus, eggs => not peanut butter

n! dimension

|A| = k, then |A=>B|<=k

all combinations with k>=4


goto R


#install.packages("arules")
library("arules")


reorder to lists

wiz odd
NOT prefix
hate prefix

read in movie transations

Item frequencey response

# summary

market basket analysis - finding things that have affinity for ech other

## Reiew
List of Topics from First Lecutre

DM1 was a survey
DM2 will got deeper


--- covered it all plus PPCA

dm2 fewer topics but ddeper

- didn't get enough homework

- stay pasat 7 dm as well

# Suggestions

- more of a fan of python - cover gotchas

dm more R than pythone | dm2 more python than R

