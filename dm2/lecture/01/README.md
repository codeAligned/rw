# Lecture 1

Wed 20810905

1. Syllabus
2. Capstone Project Ideas
3. K-Folds Cross Validation Deeper Dive into Neural Networks
4. HW - kfolds and Breast Cancer
5. If time: Incredible Growth of Python
6. Next time: SVMs and deeper dive into NN activation functions

Paul Scheps @ LMCO

## 1. Syllabus

### dm1: was sampling of data mining methods - wide not deep

- clustering
- neural nets
- logistic regression
- simulation
- market basket analysis

### dm2: deeper on some subjects, more hands on, more research oriented

#### Capstone Project

#### Specific Topics:

- Review of Neural Networks and Perceptrons / Hidden Layers
- Knowledge Discovery in Databases (KDD) vs. Data Mining (DM)
- Sci-Kit Learn
- K-Folds Validation
- Support Vector Machines
- Random Forests / Bagging
- Boosting / AdaBoost / Tree Stumps
- Nearest Neighbors (KNN)
- Synthetic Minority Oversampling TEchnique (SMOTE)
- Averaging Models and Other Ensembles
- Multi-class Classifiers
- Time Series Modeling
- Link Analysis

#### Additional Topics if we have time (probably won’t in a summer course)

- Kohonen  Maps
- Maximum Likelihood
- Fuzzy Sets
- Seriation
- Genetic Algorithms
- NN-Rules Generation
- Rules - No Tree No NN

### class format

typical class format

- 1st hour: lecture
- 2nd hour: lab and/or lecture
- cool hw - maybe present

### hw 

- 10-12 hw assignments, 10 pts each
- 9 + extra point
- kfolds validation 'caret' package

### grade

- poster project .4 (capstone project)
- mid term .3
- hw .3

## 2. Capstone Project Ideas

some kind of significant mining project, i.e.

- nfl season
- nba season
- Jeopardy
- diet evidence via twitter US vs. Europe
- trump tweets (Jason)

### Project Milestones

<ol type='a'>
<li>pick a topic</li>
<li>write a brief proposal</li>
<li>create and present a preliminary poster</li>
<li>meet regarding plan to turn project into an 'A'</li>
<li>present to the class</li>
</ol>

#### Answer the following:
- statement of problem
- how you plan to solve it
- what data will you use and howe you will get it
- what algorithms will you use
- how il lyou measure success
- what do you expect to present at the end of the term

#### project poster contest

- state problem
    + why should people care about your problem
- why should people care about the problem
- your approach to solving the problem and why you chose this design
- details of your process
- what is original about your research
- conclusions / lessons learned / implications

### Ideas

#### idea: twitter mining

- api to get live feeds
- possible projects
    + sentiment analysis: Verizon vs. Comcast (sucks, hideous, great, awesome) track sentiment over time
    + sentiment vs stock price (any correlation)
    + analyze life cycle of hashtags
    + most retweeted hashtags, tweets, etc
    + identify influential tweeters
    + trending topics over time
    + cluster tweets / topics / people
    + endless possibilities

#### idea: imdb mining

- don't crawl imdb 
- plain text limited dataset
- possible projects

    + 6 degree keven bacon
    + ratings; predict if a movie with a certain actor will be successful
    + discover any bias in ratings (new vs. old)

#### wikipedia API

- for every topic can get a snapshot of every edit ever made, every author, etc
- possible project

    + how do articles evlove
    + do most article shave less than 5 authors
    + are there prolific autoers
    + do some authors get edited more than others

#### more ideas

- yahoo boss (old)
- google api
- write a web crawler (watch out for spider traps), use crawler to automatically:
    + id experts in field
    + find most influential ewb sites
    + link analysis
    + summarize a topic
- use downloadable datasets
    + http://law.di.unimi.it/datasets.php (Lab for Web Algorithmics)
    + Also http://www.sgi.com/tech/mlc/db/
- Find the sites with the most links to/from
- Identify spam websites
- Identify spider traps
- Build a summary/map of any web site and cluster similar sites
- Categorize the entire web
- Limited only by your imagination
- Stanford Webbase – A bunch of specialized snapshots of the web
- Some time stamped
- Possible Projects
    + How have websites evolved over time
    + Automatic summarization
    + Lots of other possibilities
- [Meme tracker](http://www.memetracker.org)
- Census data
- National Institute of Justice Data
- Amazon – Find a snapshot, don’t try to crawl it.
- Linked-in (probably an API)
- Google Scholar
- Kaggle or Quandl (stay away from the Wine and Handwriting contest)
- A lot of interesting web sites have APIs

#### Jeopardy

 - http://www.j-archive.com/showgame.php?game_id=6079
- 357,000 clues and answers.  34 seasons of complete games of Jeopardy
- Do something with this database like look for categories that come up repeatedly (e.g. rivers in Europe)
- Or something else.  There must be something cool that can be done with this database

#### more ideas

- trump / hillary tweets
- NYT articles

### goal

- expand on something we did in class
- improve an algorithm
- do something you love

## 3. K-Folds Cross Validation Deeper Dive into Neural Networks

"Perceptron" from 1950s model brain neurons

in -> weight -> sum -> activate (with activation function, could be logistic)

original activation function was Heaviside function

1 if w*x+b > 0  
0 otherwise

linear seperable

perceptron would solve something that was linear seperable

could combine perceptrons (more hidden layers?)

simple nn layers

input -> hidden -> output

yay: scikitlearn!

##4. HW - kfolds and Breast Cancer

sciKitLearnBreastCancer.doc

don't want false negatives - more harmful than a false positive

Breast cancer.  

wdbc_names.txt

a) radisu
b) texture ...
j) fractal dimension

569 recrods

confusion matrix
precision / recall / f1-score support

repeat in R

cross validation can improve results

use loops instead of caret to make k folds

4foldsexample.html

## More on hidden layers / hidden nodes

various rules of thumb

ex/ 99 inputs, 1 outputs

1st layer 66 nodes
2nd layer 33 nodes
outlayer 1

idea: cellular autonoma and neural net choices

Matt long resarch notes

how many hiddeen lauers
- try model first with 0 hidden layers
    + multiple regression will work if linearly seperable
    + perceptron will still work but be less explainable

- NNFAQ suggests no rules
    + proper way is to test, test ,test
    if validation error higher than test overfie

plot traingin vs validation error
want exact # of hidee node were training erro hits minimum

checkout neural network FAQ
ftp://ftp.sas.com/bub/neural/FAQ.html#quetionms 

UCI breast cancer set

# Kfolds on breast cancer
1. redod breast cascne in r ro ptyeo w/ 5 fold cross validatio
2. 9/10, ask an answer a challenge qetoin on tope of nerual network or k folds for 10th poit

google uci breast cancer

# when k folds goes right use reuse all of your data for 
# what happens when k folds goes horribly wrong




##5. If time: Incredible Growth of Python


##6. Next time: SVMs and deeper dive into NN activation functions
