## File: intro.R
## Author: John Rothfels:Stanford
## Edited by: A. Breitzman 1/8/2017 and 1/23/2018
## Introduction to R
## Lecture 2
## ----------------------------

#Part 1: Basics
#Note comments are started with hashtags #
#Simple command 2+2



2+2
#use ctrl-enter to execute.  Or the run command above


# colon operator : can be used to create a sequence of numbers
1:5

3:7

#You might have noticed that R is an interpreted language (like Python) as opposed 
#to a compiled language like C, C++, or java. That means you just type something and
#get a result immediately.  If you get an error you just fix it and move on.


## To begin, try typing in the following expressions in the R console.
## Note that whitespace is almost always optional, except within compound
## operators (like '%%' and '%/%' and '<-')
2
2 + 2
2 - 2
2 * 2
9 / 2         # normal division defaults to double precision
2 ^ 4
9 %% 2        # mod operator
9 %/% 4       # integer division

## R ships with various primitive mathematical functions.
sqrt(9)
cos(pi)       # argument in radians
log(1)        # natural log
exp(1)
log(exp(3))
floor(3.5)
ceiling(3.5)



## To create variables (objects), use the assignment operator: '<-'
## Note that '=' is also valid, but causes scope issues so we prefer '<-'
x<-2              # assignment
median(x = 1:10)  # assignment vs equals assignment
x   
median(x <- 1:10)
x   

x                 # printing
(x <- 2)          # assignment AND printing; you'll almost never do this
2 * x
x                 # NOTE: x not modified by previous line
y <- 3
x + y

## Both x and y are vectors of length one (even though they look and act like
## integers). You will sometimes want to think of these as mathematical vectors,
## and sometimes just think of them like ordered lists of elements whose
## types are all the same (e.g. a bunch of ints).

## To make longer vectors, use 'c(...)'. 'c' stands for concatenation.
x <- c(3, 1, 4, 1, 5)   # x is now a vector of length five
2 * x                   # component-wise arithmetic
x + c(1, 2, 3, 4, 5)    # c(3+1, 1+2, 4+3, 1+4, 5+5)

## When performing arithmetic with vectors of unequal length. The shorter
## vector is "recycled" enough times to equal the length of the longer vector.
## When the length of the longer vector is not evenly divisible by the length
## of the shorter vector, the shorter vector will be fractionally recycled
## and a warning will be issued.
c(1, 2, 3, 4, 5, 6) * c(1, 2)    # c(1*1, 2*2, 3*1, 4*2, 5*1, 6*2)
c(1, 2, 3, 4, 5, 6) * c(1, 2, 3, 4)    # c(1*1, 2*2, 3*3, 4*4, 5*1, 6*2)


## You can make vectors by concatenating other vectors together.
## (This is actually what we've been doing all along -- remember, '0' is
## thought of by the system as a vector with one element.)
y <- c(x, 0, x)
y
## Q: What will the following expression evaluate to?
## x: vector of length 5
## y: vector of length 11
## 1: vector of length 1
2*x + y + 1

#is this what you expected?
## A: A vector of length 11: 2*x repeated 2.2 times, y repeated once, and
##    1 repeated 11 times.
## let's break this into pieces
x
2*x
y
2*x+y
2*x+y+1





## R comes with built-in vector operations (i.e. functions which take vectors
## as arguments). Here are a few:
prod(x)
sum(x)
length(x)
mean(x)
var(x)
max(x)
min(x)
range(x)
sd(x)
sort(x)       # does not change the value of x, but returns a sorted vector
order(x)      # the sorted ordering of x by index
x
y<-sort(x)
#what is the value of x and y?
x
y


## When you see a function but you don't know what it does, you can
## look at its documentation.
?order
help(order)

## You can also search through documentation by topic, though I've
## always found this is better done in a Google search or on Rseek.
help("sort")

## What happens if we call a function without parenthesis?
order

## Using c(...) syntax can become annoying. Here are some alternatives.
-1:30
30:1


n <- 5
1:n
1:n+1                 # NOTE: the ':' operator is very closely binding.
1:(n+1)               # This is different from what we have above.


## Let's take a brief tangent now and look at how R function calls work.
## Use 'args(fn)' to print the arguments of a function. This will only show
## you the names of the arguments, not what they mean. For that information,
## use '?fn' or 'help(fn)'.
args(log)

## Notice that the 'log' function actually has 2 parameters: 'x' and 'base'.
## The 'base' parameter is given a default value of 'exp(1)' while the 'x'
## parameter has no default value and is thus required in the function call.
exp(1)
log(exp(3))
log(100, 10)           # sets the 'base' parameter to be 10
log(100)

## We can also make function calls by explicitly setting parameters by name.
## Each of these produces the same output as 'log(100, 10)'.
log(100, base = 10)
log(x = 100, base = 10)
log(base = 10, x = 100)

## Notice that when parameters are explicitly named, ordering does not matter.
## You can mix and match named and ordered arguments and R will figure out
## how to assign parameters using the default ordering in the function
## definition (the default order is shown by 'args').

## Back to vector instantiation, the ':' operator is generalized by the
## function 'seq(...)'.
2:10
seq(2, 10)

args(seq)
?seq

## R's '...' parameter is tricky to understand, and is one of the weirder
## aspects of the language. Roughly speaking, '...' means that some arguments
## given to function are passed to other functions inside the original.
## It allows an arbitrary number and variety of arguments
## Moreover, for certain functions ('seq' included) certain named parameters have
## special meaning even though they don't appear in the function signature. You
## can find these in the function documentation: '?seq' or 'help(seq)'.
## Here, from and to do have special meaning (and are separate from ...)
seq(from = 2, to = 10)
seq(-5, 5, by = .2)
seq(from = -5, by = .2, length = 51)
seq(from = -5, by = .2, length = 12)

## You can replicate vectors using the 'rep' function:
x
rep(x, times = 5)         # concatenate x together 5 times
rep(x, each = 5)          # each component of x copied 5 times

## R has logical values and operations.
TRUE
FALSE

## These variables are instantiated for convenience at the beginning of
## an R session, but they can be overwritten. Be careful!
T
F

if (TRUE) {
  print("Hello world.")
}
if (FALSE) {
  print("Goodbye, cruel world.")
}

## So far, we've seen numeric vectors (vectors which contain numeric data).
## R creates logical vectors with logical operators.
x > 3                     # logical operators are the same as in C, C++, Java

## Combine logical operators into logical expressions
x > 3 & x < 5             # single ampersand for component-wise evaluation
x > 3 && x < 5            # double ampersand for short-circuit evaluation
## this is a silly command. && checks only the first element of the vector

Inf
x < Inf && x > -Inf
x > 3 | x == 1
!(x > 3)

## R also has character vectors (where elements of the vector are each
## strings). You can create strings with "" or ''.
nchar(z)

length("hello world")   ## Vector of length 1
nchar("hello world")    ## Goes into vector, then finds the object length
'goodbye, cruel world'
seuss <- c("one", "fish", "two", "fish", "red","fish","blue","fish")
seuss

## The 'paste' function can be used for character vector manipulation.
paste(seuss, c("green", "eggs", "and", "ham"), sep = ":")

paste(c("one", "two", "red", "blue"), "fish", collapse = ", ")

deck <- paste(rep(c(2:10, "J", "Q", "K", "A"), each = 4),
              c("C", "D", "H", "S"), sep = "")
deck
## Note: there are a bunch of string utilities in R both built into default
## and in add-on packages. For the most part, though, doing fancy string
## manipulation is a bit painful in R. You've been forewarned.


## Vector indexing begins at 1, not 0.
deck[1]
deck[c(1, 3, 2)]   # use numeric vectors for multiple index selection
# Note the order of elements returned
deck[c(1,2)]    # use negative numbers to specify indices to exclude

deck[c(T, F, F, T, T)]    # (T = keep, F = exclude)
deck[c(T, F)]             # NOTE: vector recycling

x[x >= 3]                  # components (not indices) of x that are >= 3
x >= 3                     # T/F based on boolean
which(x >= 3)              # indices of x that have components >= 3
x[which(x >= 3)]

x[1:3]                    # the first 3 elements of x
x[c(1, 1, 1, 1)]          # the first component of x repeated 4 times

## The [] operator returns a reference to elements of the vector so we can
## modify the vector in place.
seuss
seuss[1] <- "uno"
seuss

w <- c(1, 0, -1, -3)
## I won't print out w here because notice it's contents are available 
## as an environment variable using Rstudio
w[w < 0] <- -w[w < 0]     # same effect as w <- abs(w)
w
## What happens if use "single-argument" functions over vectors?
x <- 1:10
sin(x)                    # component-wise evaluation


## Appendix: NA and NaN Values:
## ----------------------------
## When statistical data is unavailable or missing, we use the special
## value 'NA'. Operations on NA values result in NA values.
z <- c(1:3, NA)
z
z + 1

## The special function 'is.na(...)' will return a logical vector with
## TRUE indicating NA values.
is.na(z)        # c(FALSE, FALSE, FALSE, TRUE)
z[4] == NA      # NA
## Note you might have expected TRUE instead of NA but NA can't be compared or operated on.
## That's why we have the function is.na()


## A second kind of "missing" value is the so-called 'Not a Number', or NaN.
0/0
is.nan(0/0)
0/0 + 4         # NaN

## sample gives a set of random numbers between a range
x <- sample(-100:100, size = 100)   # random numeric vector with values between
# -100 and 100
x
## Are your random numbers the same as mine?  What if we do it again?
x <- sample(-100:100, size = 100)   # random numeric vector with values between
# -100 and 100
x
## Notice we got a different set of numbers which is what we want and expect.
## However what if we wanted to repeat an experiment at a later date and wanted
## to ensure that we got the same random sample?  Just set a seed and use the same seed later

set.seed(2)
x <- sample(-100:100, size = 100)   # random numeric vector with values between
# -100 and 100
x

set.seed(2)
x <- sample(-100:100, size = 100)   # random numeric vector with values between
# -100 and 100
x

## Exercises:
## ----------
## 1) Change the sign of every odd number in x.
# ANSWER:
x[x %% 2 != 0] <- -x[x %% 2 != 0]
x
## That's a little bit too slick!
## we could also do with sapply or a loop, but we haven't talked about those yet

## 1a) Change the sign of every even number in x







## 2) Take the dot product of x and y.
x <- 1:100
y <- 100:1

# ANSWER:
sum(x * y)

## substitute your name below
myName = "firstname, lastname"

## Choose compile report on the file menu to save this as a pdf.





