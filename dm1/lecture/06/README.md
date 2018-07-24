Ron - talk idea - scraping with selenium 
Ex: TLDR translator based on topic modeeling of scraping hacker news
auto titler

# Lecture 06

1. Minitalk
2. Midterm **next Monday**
3. Decision Tress Part II, more CART, C5.0
4. Rodeo

## Minitalk: Dimitri Demergis - Kaggle

Kaggle
Titanic Dataset
Yassin Eghouzam Jupyter Notebook

- uses Tukey method to find outliers
IQR # interquartile range
1.5 * IQR

cross validation
with k folds testing
5 pieces
test 5 times on 20%
implies well behaved models

he plotted learning curves

can show if model is overfitting

want cross validation score to get as close to training score as possible

used a vodint classifier  to predict from multiple models

got 83% prediction

## Brietzman response

We will be doing a kaggle competition

Example: Digit Recongnizer
MNIST data
Computer vision fundamentals

Ex: Anthony Ratliff =- 99.5% bettin in prediction hand writing

can learn from kaggle compettiong
example: use a log of a distribution is a standard trick

ex. Master as a title implied age coudl be filled in

title -> becsome

## Gre Widmair - Scrapint

Scapy build aroun 'spiders' - crawlers
spirit of don't repeat yourself frameworks

Lyst
CarrerBuilder
data.gov.uk
parse.ly

easy to extract with CSS XPath
ipython like shell
wider range fou built-in extension and muddle ware
- read robots.txt fiel
- crawl depth restrincing
- user agen sppofinv
- http features like cmopreseeetion

### easy setup
pip install scrapy
scrapy startproject
_init__py
items.pye
__pycache__
pupelines.py
s;iders
scrapy genspider <scratper name<start url>
crapy crawosl

example rowan htmlfile

## Decision Trees

- good for? determining classification yes/no data
- how prepare data? make categorical
- what are poorly named algoritms? C4.5 CART
- what kind of algorithms? greedy

### shortingcming
- cn over fit

### CART

CARTexample.xlsx to calculatge Phi
Excel spreadsheet showing probablity of good (Left) PL vs PR (right)

shoes fir decision should be on home value between 0-199

K folds will give a shift in accuracy if you don't have enough data

crerdit
└───0-199
    ├───n
    │   └───saving.gt.10
    │       ├───n
    │       │   └───good
    │       └───y
    │           └───asset.gt.500
    │               ├───n
    │               │   └───bad
    │               └───y
    │                   └───good
    └───y
        └───bad

have to rebuild table with results after each decision
each stage is slightly easer

### C4.5

C5 uinsts infomration gain or entropy reduction

consider coin toss: 1 bit needed
n result then n bits right?

lg is log base 2
{? -Lg(P)]
give how many bits

smallest number of bits required

H(x) = - sume (pj log2 (Pj))

want to maximimize information gain

C:\Users\AFMS\c4.5>tree
Folder PATH listing for volume OS
Volume serial number is DCE0-F990
C:.
├───home0-199
│   └───bad
├───home200-499
│   ├───saving.gt.10
│   │   └───bad
│   ├───saving5-10
│   │   └───good
│   └───savings.lt.5
│       └───good
└───home500+
    └───good

### Tree pruning
larose data mining book shows algoritms
let R do the work

lecture6.r

decision trees y is always on left

c50 library for making c5 trees

c50(features, result)

watch the plots
need to know grey means good credit
black means bad credit

can override view of the tree

#### Excample = use censesadult50 data set from uci machine learning repository

predict income>50k based on other features

historgram of age

must break continous data into categories

test = -train
everything except for what is in train
negative means 
R [rows,columsn]

data2[train,] means all columsn in row dataset

rpart is a nother tree library

tilde . means vesus every other varible
i.e. income ~ .


library(rattle)
