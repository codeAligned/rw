import pandas as pd
from sklearn import datasets
from sklearn.ensemble import RandomForestClassifier
import sys
print(sys.version)

def sklearn_to_df(sklearn_dataset):
    df = pd.DataFrame(sklearn_dataset.data, columns=sklearn_dataset.feature_names)
    df['y'] = pd.Series(sklearn_dataset.target)
    return df

df = sklearn_to_df(datasets.load_breast_cancer())
y = df['y']
X_cols = df.columns[0:-1]
X = df[X_cols]
print(X.shape, y.shape)

m = RandomForestClassifier()
m.fit(X,y)
yh= m.predict(X)
print(yh.shape)

import SALib.sample.saltelli as ss
import SALib.analyze.sobol as sa

problem = {
    'num_vars': 30,
    'names' : list(X_cols),
    'bounds' : [ [min, max] for min, max in zip(X.min(), X.max()) ],
    'groups' : None
}

length = (30+2)*17 # 512: 30 features +2 saltelli boundary less thant 569 records


sample = ss.sample(problem, length, calc_second_order=False)
si = sa.analyze(problem, yh[:length], calc_second_order=False)

# print("{:28s} {:>5s} {:>5s} {:>12s}".format("Name", "1st", "Total", "Mean of Input"))
# for name, s1, st, mean in zip(problem['names'], si['S1'], si['ST'], sample.mean(axis=0)):
#     print("{:28s} {:=5.2f} {:=5.2f} ({:=12.2f})".format(name, s1, st, mean))

lst = [list(x) for x in zip(problem['names'], si['S1'], si['ST'], sample.mean(axis=0))]
#print(lst)

df = pd.DataFrame(lst, columns=["Name", "1st", "Total", "Mean of Input"])
df1 = df.sort_values(by=['1st','Total'], ascending=[False,False])
print(df1)
dft = df.sort_values(by=['Total','1st'], ascending=[False,False])
print(dft)

# si_out_list = [name, s1, st, mean in zip(problem['names'], si['S1'], si['ST'], sample.mean(axis=0))]
# print(si_out_list)



