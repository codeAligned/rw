import sys
import string
import matplotlib.pyplot as plt
from wordcloud import WordCloud, STOPWORDS

 
def getLine():
    try:
       line = raw_input()  
    except EOFError:
       return '<EOF>'
    return line

words=''
while 1:
    l = getLine()
    if (l == '<EOF>'):
      break
    else:
      s=l[53:]
      words +=s[:s.find('\t')]+' '

no_urls_no_tags = " ".join([word for word in words.split()
                            if 'http' not in word
                                and not word.startswith('@')
                                and word != 'RT'
                            ])
                            
for c in string.punctuation:
  no_urls_no_tags= no_urls_no_tags.replace(c,"")                            
                            
STOPWORDS.add('amp')    
STOPWORDS.add('want')
STOPWORDS.add('new')
STOPWORDS.add('via')
STOPWORDS.add('man')
STOPWORDS.add('will')
STOPWORDS.add('here')
STOPWORDS.add('Heres')
STOPWORDS.add('Here')
                        
wordcloud = WordCloud(
                      font_path='C:/Tweets/cabin-sketch-v1.02/CabinSketch-Regular.ttf',
                      stopwords=STOPWORDS,
                      background_color='black',
                      width=1800,
                      height=1400
                     ).generate(no_urls_no_tags)

sys.stdout.write('%s\n' % no_urls_no_tags)

plt.imshow(wordcloud)
plt.axis('off')
plt.savefig('./my_twitter_wordcloud_1.png', dpi=300)
plt.show()
