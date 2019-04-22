import numpy as np
import pandas as pd
size = 50
df=pd.DataFrame(np.random.randint(0,101,size*2).reshape(size,2),columns=['x','y'])
df['triangle']=df.index < size/2
df['triangle']=df['triangle'].astype(int)
df.sort_values(by=['x'],inplace=True)
df.to_csv('data.csv', index=False)