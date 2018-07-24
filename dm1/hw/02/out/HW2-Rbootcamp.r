## Assignment 2: R Bootcamp Part 1
##
## File: bootcamp.R
## Author: Ben Holtz (bholtz) and Kevin Shin (hgkshin)
## Modified by A. Breitzman
## Description: R Bootcamp
## ------------------------------------------------------------------------


#The regular problems should be fairly easy.
#The challenge problems will take quite a bit of thought.


## Section 1: R Arithmetic!
## Please complete both problems in one line without using any built-in 
## functions for shortcuts (e.g. Don't use "norm" for Euclidean norm).

## Problem 1.
## Using the vector x below, express the Euclidean norm of x.
## Recall that the Euclidean norm of a vector v = <v1, v2, ..., vn>
## is the square root of the sum of the squares of it's terms, i.e
## sqrt(v1^2 + v2^2 + ... + vn^2)
## Complete the problem using one line only.
x <- c(4,2,8,6,4,9,2,4,1,6,4)
## BEGIN YOUR CODE HERE ##
sqrt(sum(x*x))
##  END YOUR CODE HERE  ##

## Problem 2.
## Using the vector x below, divide every element in
## an even index by two, without modifying the elements in odd indices.
## Example:

## Complete the problem using one line only.
## Hint you do not need a loop.  This will work with a multiplication.
x <- 1:10
## BEGIN YOUR CODE HERE ##
x/c(1,2)
##  END YOUR CODE HERE  ##
## ------------------------------------------------------------------------

##Challenge Problem 1
##Repeat problem 2 but make your one line general enough that it works regardless of vector length.
##Hint you may want to use an 'if' and 'else' and note they can still be in one line.

x <- 1:10
##Begin your code here
x <- ifelse(x %% 2 == 0, x/2, x)
##End your code here
x

x <- 1:13
##Insert your same code here
x <- ifelse(x %% 2 == 0, x/2, x)
##End your code here
x





## Section 2: R Knowledge!
## Please write the answers for the following questions
## in the given commented area.

## Problem 3.
## Recall that vectors in R must be of a single type.
## What is the returned type of the vectors in following expressions?
c(1, 2, 3, 4, 5, 6)
## ANSWER: double
c(1, 2, 3, 4, 5, TRUE)
## ANSWER: double
c(1:4, 1:4, TRUE, 0+0i)
## ANSWER: complex
c(0, FALSE, 'TRUE')
## ANSWER: character
c(c(c(1), 1), 1)
## ANSWER: double
## ------------------------------------------------------------------------

## Section 3: Lists and Vectors!
## Please complete each problem in one line without using any built-in 
## functions for shortcuts (e.g. Don't use "norm" for Euclidean norm).

## Given the list below, tricky.list, how do you access the following elements:
tricky.list <- list(1:10, 11:20, list(21:30, list(31:40)), 41:50)

## Example:
## The vector 1:10? (Solutions to this one given as a gift :D)
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
tricky.list[[1]]
##  END YOUR CODE HERE  ##

## Problem 4.
## The value 42?
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
tricky.list[[4]][2]
##  END YOUR CODE HERE  ##

## Problem 5.
## The range 13:17?
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
tricky.list[[2]][3:7]
##  END YOUR CODE HERE  ##

## Problem 6.
## Even values in the range 31:40?
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
unlist(tricky.list[[3]][2])[unlist(tricky.list[[3]][2]) %% 2 == 0]
##  END YOUR CODE HERE  ##

## challenge Problem 2.
## The sublist list(1:10, 11:20, 41:50)?
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
tricky.list[c(1, 2, 4)]
##  END YOUR CODE HERE  ##
## ------------------------------------------------------------------------

## Section 4: Dataframes and factors!
## Please complete each problem in one line without using any built-in 
## functions for shortcuts (e.g. Don't use "norm" for Euclidean norm).
## We'll use the mtcars dataframe that is pre-loaded into R at start up.

## How do I access the following:
## Example.
## The first six rows? (Solutions to this one given as a gift :D)
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
head(mtcars)
##  END YOUR CODE HERE  ##

## Example. 
## The first two columns? (Solutions to this one given as a gift :D)
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
mtcars[1:2]
##  END YOUR CODE HERE  ##

## Problem 7.
## The first, third, and fourth colums?
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
mtcars[c(1,3,4)]
##  END YOUR CODE HERE  ##

## Problem 8.
## The first, third, and fourth rows?
## Complete the problem using one line only.
## BEGIN YOUR CODE HERE ##
mtcars[c(1,3,4),]
##  END YOUR CODE HERE  ##

## Problem 9.
## The mileage and horsepower of only those cars with 4 cylinders?
## Complete the problem using one line only.
## hint: you might check what subset(mtcars,cyl<6) does. Or you might be able to use which
## BEGIN YOUR CODE HERE ##
mtcars[mtcars$cyl == 4,c("mpg","hp")]
##  END YOUR CODE HERE  ##

## Challenge Problem 3
## Return the number of cylinders, horse power, and 1/4 mile time of all cars, but 
## in order of fastest to slowest. Do you see anything interesting?
## Note: The column 'qsec' is the 1/4 mile time for each car.
## Hint: You might want to look through the documentation for the sort
## function (?sort). 
## Complete the problem using two or fewer lines only.
## BEGIN YOUR CODE HERE ##
mtcars[with(mtcars, order(qsec)),c("cyl","hp","qsec")]
##  END YOUR CODE HERE  ##

