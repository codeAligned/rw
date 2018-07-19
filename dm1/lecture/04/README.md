# Normalizing Data

Different measures scaled between 0 and 1.

SVM and something else may go between -1 and +1.

# Binary Distance

- symmetic binary distnace
- asymmetric binary distance

sim = similarity  
dist = distance

dist = 1 - similarity
similarity = 1 - distance

distance measure is also known as the jaccard  
typiclly used for text mining

# Frequency example

# Categorical Data

# Ordinal Example

# ordinal means in order

(rank -1)/(max -1)  
(x-min) / (max - min)  

Could use *Normalized Weighted Euclidian Distance*  
use weights to give preference to different parameters
use weights = 1 by default

# Mixed data example

What is distance between Sam and Michelle?

Weight of two nominals: weight it twice?
On favorite color and blood type? 

| | sue | jim | joe | jane | sam | michelle
| susan | 
| jim |
| joe |
| jane 
| sam |
| michelle | 

or just treat each colum as its own dimension added up for the final simialrity matrix

# Example movie database in R

This time normalize the data

Moives2.r

selecting is similer to pandas but with <-

distance matrices

heirarchical and k-means clustering

# Intro: Quick Demos

Quick 1 to 5 minute demos
because no capstone project

# Need to mak 1 to 5 5 minute demos

- Microsfot Power BI
- PyPlot (seaborn)
- etc

# RDBMS

1. MS Access
2. SQLite
3. Integrating Python and SQLite
4. SQLiteStudio

# Ex: moderated palen of companies that hire a lot of data analayst
3 most important skills for data analyst:
1. SQL
2. Python
3. R

select
group by
having
where
order by
drop

md access has a query by example system
rowan has office professional license

Ex: Patent database
- 1:1 Patent#, Title, Abstract, Application data, Issue Date
- 1:many inventors
- 1:many assignees
- 1:many patent classes
- 1:many patent office classification
- 1:many npr - non patent references

Wind?turbine
? is wildcard

search for words and classes
i.e. fan - bladed member

Access report writer

# Data warehousing

? datamine access database - for datamining
ex/ patent database 6 million patents
Big Data (peta bytes)
Static vs. streaming data (twitter)

1790 analytics - patent mining - Tony Breitzman
masters on signal processing

# SQLite

- No client/server, rather it is a c library
- invented by general dynamic for navy

ex/ `pip install sql lite`

ex/ DROP TABLE IF EXISTS transactions


```
conn = sqllite3.connect('grocery.db')
```

prefer to commit() in batches

ex/ SQL lite FAQ

SQLiteStudio is a userfule front SQLite
Can also use access with ODBC back end

SQLite max size 104TB

temporary tables can be faster than joins

Access with ODBC connection - pretty good, can can be performant and have lots of reports

Open source: SQLite, Postgres and mySSQL
Pay to ply: Oracle, SQL Server, Aster something

Suggest: Take a database course

---
Anything of intest






Size vs. time


