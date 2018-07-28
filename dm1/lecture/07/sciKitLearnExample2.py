import numpy as np
import pandas as pd
from sklearn.cross_validation import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score
from sklearn import tree
import os
os.getcwd()
os.chdir('C:\\Users\\abrei\\Desktop\\DMweek6')

censusData=pd.read_csv('censusAdult50k.csv',sep=',')
censusData.head()
len(censusData)
censusData.shape
censusData.head()

df_with_dummies = pd.get_dummies(censusData)
df_with_dummies.head()
df_with_dummies.shape
df_with_dummies.columns[105:109]

censusData.columns
for column in ['Education', 'MaritalStatus']:
    dummies = pd.get_dummies(censusData[column])
    censusData[dummies.columns] = dummies

censusData.head()
censusData.shape

print censusData['CapitalGain'].value_counts()
def simplifyGain(row):
    if (row['CapitalGain']==0):
        return 0
    elif (row['CapitalGain']<1000):
        return 500
    else:
        return 1000

censusData['SimpCapGain']=censusData.apply(simplifyGain, axis=1)
censusData['SimpCapGain'].value_counts()

censusData['CapitalLoss'].value_counts()
def simplifyLoss(row):
    if (row['CapitalLoss']==0):
        return 0
    elif (row['CapitalLoss']<1000):
        return 500
    else:
        return 1000
        
censusData['SimpCapLoss']=censusData.apply(simplifyLoss, axis=1)
censusData['SimpCapLoss'].value_counts()

censusData.columns
censusData['JobClass'].value_counts()
censusData['Relationship'].value_counts()
censusData['Job'].value_counts()
censusData['MaritalStatus'].value_counts()
censusData['Race'].value_counts()
censusData['HoursPerWeek'].value_counts()

def simplifyHours(row):
    if (row['HoursPerWeek']<40):
        return 20
    elif (row['HoursPerWeek']==40):
        return 40
    else:
        return 60
        
censusData['SimpHours']=censusData.apply(simplifyHours, axis=1)
censusData['SimpHours'].value_counts()

censusData['Age'].value_counts()

def simplifyAge(row):
    if (row['Age']<=20):
        return 20
    elif (row['Age']<=30):
        return 30
    elif (row['Age']<=40):
        return 40
    elif (row['Age']<=50):
        return 50
    elif (row['Age']<=60):
        return 60
    elif (row['Age']<=70):
        return 70
    else:
        return 80
        
censusData['AgeRange']=censusData.apply(simplifyAge, axis=1)
censusData['AgeRange'].value_counts()

censusData.columns


X=df_with_dummies[:,0:108]

X=censusData.values[:,0:13]
Y=censusData.values[:,14]
X[0]
Y[0]

X_train, X_test, Y_train, Y_test = train_test_split(X,Y,test_size=0.2,random_state=100)

c5 = DecisionTreeClassifier(criterion='entropy',random_state=100,max_depth=5,min_samples_leaf=5)
c5.fit(X_train,Y_train)