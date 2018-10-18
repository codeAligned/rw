getwd()
df<-read.csv("exam2cart.csv",header = TRUE, sep = ",", stringsAsFactors = TRUE)
head(df)
dim(df)

## make a CART tree
##install.packages("tree")
library(tree)
names(df)
tr<-tree(salary_level~job+gender+age_level,df)
plot(tr);text(tr,pretty=1)
