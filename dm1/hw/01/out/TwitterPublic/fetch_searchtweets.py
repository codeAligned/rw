import sys
import time
import os
from twitter import *
import json
from string import printable

def removeNonAscii(s): return "".join(c for c in s if c in printable)

def myClean(s):
  s = removeNonAscii(s)
  s = ' '.join(s.split())
  return s

#-----------------------------------------------------------------------
# load our API credentials 
#-----------------------------------------------------------------------
config = {}
execfile("config.py", config)

twitter = Twitter(auth = OAuth(config["access_key"], config["access_secret"], config["consumer_key"], config["consumer_secret"]))


# make sure that the directory 'Tweets' exists, this is
# where the tweets will be archived
wdir = 'C:\Tweets'
searchName = sys.argv[1]
search = sys.argv[2]
print "search:" + search + "\n"
id_file = searchName + '_id.txt'
search_file = searchName + '.txt'


if os.path.exists(wdir + '\\' + id_file):
  f = open(wdir + '\\' + id_file, 'r')
  since = int(f.read())
  f.close()	
else:
  since = 0

formerSince = since

query = twitter.search.tweets(q =search,since_id=str(since),count=100)
statuses = query['statuses']

while (len(statuses) < 5000):
        try:
            nextResults = query['search_metadata']['next_results']
            print nextResults
        except KeyError, e:
            break
        print str(len(statuses)) + ' results have been downloaded'
        kwargs = dict([ kv.split('=') for kv in nextResults[1:].split("&") ])
        if (int(kwargs['max_id']) < since): break  #this is a kludge!
        nextResults = twitter.search.tweets(**kwargs)
        query = nextResults
        statuses += nextResults['statuses'] # cool append notation
        print 'A total of ' + str(len(statuses)) + ' have been downloaded'


f = open(wdir + '\\' + search_file, 'a+')

for result in statuses:
    temp = int(result['id_str'])
    if (temp > since): since = temp  #we need the highest id # for next time
    if (temp > formerSince):
       output = str(result["created_at"]) + '\t' + str(temp) + '\t' + myClean(result["text"])  +  '\t' + "-1" + '\t' + str(result["user"]["screen_name"])
       try:
        url=result['entities']['urls'][0]['expanded_url']
        output += '\t' +removeNonAscii(url)+ '\n'
       except Exception, e:
        output += '\n'
       f.write(output)

f.close()
 
# write last id to file
f = open(wdir + '\\' + id_file, 'w')
f.write(str(since))
f.close()
