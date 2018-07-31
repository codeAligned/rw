# Lecture 8 

see centroids.html r notebook

## cosine distance
- cosine distance is angle between vectors the points

can normalize vectors to unit vector (not neccessary, nice to have)
pointless for vecors of hundreds of dimension anyway

- everything I needed to know about data science I learned by watching spinal tap

## euclidean centroid

add all components / number of points

## how compute centroid with combo distance?

we care about centroids when computing kmeans.

*clustroid* is an actual point in the cluster that is closest to teh actual theorretical cntroid.
sample that minimizes distance from all other samples in the cluster
use it when computing a centroid could be expensive or not computable
i.e. when using an exotic distance measurement

## K Means in r
- uses euclidean
- use spherical k-means for cosine distance

# Heirarchical clustering

Single, Complete, Average Link - used with heirarchical clusterin

cleanly seperable clusters will always work out the same way regardless of link method choice

choosing the different link methods matters when data is 1/2 between clusters

## Reticulate ( run python on R )

- included with R studio
- import pytyone and r

```{R}
library(reticulate)
source_pythong('dummy.py')
dummyMethod(1,2)
```

returns the R vector

auto converts to pands

## Rodeo





