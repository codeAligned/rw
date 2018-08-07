# Lecture 10

8/6/2018

Agenda:

1. Homework: Titanic
2. Naïve Bayes R census file I meant to show last week
3. Any mini-talks?
4. Addendum to Will’s multiprocessing talk.  Pool – hangs.  Why?  Non-Pool doesn’t work as expected.  Why?
5. Main topic: Simulation; Montecarlo.xls (do pi, cereals, retirement). Repeat retirement in R.
6. Future Schedule: Only 4 meetings after tonight:

## 1. Homework: Titanic

Do Titanic prediction and submit code as well as picture of your rank.  You can use the kernel Dmitri [presented](https://www.kaggle.com/yassineghouzam/titanic-top-4-with-ensemble-modeling) or any other kernel.  Or create your own model.  Grading: any submission is worth 8/10.  Use a method other than above to make submission.  Any score worth 9/10.  Find a way to beat 80% accuracy worth 10/10.  Homework submission consists of your code, your submission, and screenshot of your result. (show example).

## 2. Naïve Bayes R Census File

naiveBayesR.doc vs. DecisionTree

- naive bayes: overestimates
- tree: underestimates

could do an ensemble of the above

generally want to err in false positives one way or the other:

- good/bad credit - lender can loose more more on giving someone credit who has bad credit
- cancer tumor detector - want to fail in over identifying tumors (false positives better)
- want to over id terrorists

## 3. Mini-talks

### a. PyQT mini-talk was given before

Additional GUI frameworks are discussed [here](https://insights.dice.com/2017/08/07/7-top-python-gui-frameworks-for-2017-2).

### b. Algorithmia API - Matt Grieci

scale algorithms

can make money if you ralgorithm is good

api key

```{Python}
import Algorithmia
input = 'x'
...
```

### c. Python Performance Timing - Ron Neely

Start with Jupyter [notebook](../../minitalks/ron/py_perf_time/fibo.ipynb).

## 4. Multiprocessing Pool – hangs.  Why?

Look at the multi-processing example.  Why doesn't it work?  Every process appears to run within a single thread.

## 5. Lecture 13 Monte Carol Methods

[Monte Carlo methods](https://en.wikipedia.org/wiki/Monte_Carlo_method) (or Monte Carlo experiments) are a broad class of computational algorithms that rely on repeated random sampling to obtain numerical results. Their essential idea is using randomness to solve problems that might be deterministic in principle. They are often used in physical and mathematical problems and are most useful when it is difficult or impossible to use other approaches. Monte Carlo methods are mainly used in three problem classes:[1] optimization, numerical integration, and generating draws from a probability distribution.

Invented by Mathematician Stan Ulam and first implemented in Computer by John Von Nuemann

Three classes of methods:

- Numerical solutions to problems (computing Pi, estimating integrals etc.)
- Mathematical Modeling (can be used instead of regression for example)
- Simulation.  Often combined with decision trees to test real life outcomes.

Examine 3 simulations in .xls and .r.

a. calculating &pi;
b. cereal ratings by consumer reports
c. retirement saving

### a. calculating &pi;

&pi; can be calculated by the number for random samples found to be in a unit circle divided by the number for random samples found in the square bounding tangents to the unit circle.

### b. cereal ratings by consumer reports

an example of regression

knowing the order of the polynomial can be tricky

assume the order of the polynomial is the number of features you have

### c. retirement saving

financial simulation of what S+P 500 weighted by market cap

S&P 500 is similar to dow jones (old 29 industrial companies), but better with 500 relavent companies.
NASDAQ - tech companies
Russel2000

put money into retirement account

monthly closings in S+P 500
open, high, low, close, volume, adj close, gain/loss

55 years closing prices

Will I run out of money.  Input questions:

- when retire?
- how much putting away?
- how much draw when retire?
- how many years draw?

## 6. Future Schedule

- Neural Networks
- Model Matrix
- Principal Components Analysis
- Logistic Regression
- Confusion Matrix
- Lift/Gain
- Market Basket Analysis
- Loose Ends
- Final
