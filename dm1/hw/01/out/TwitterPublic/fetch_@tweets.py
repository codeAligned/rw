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

# make sure that the directory 'Tweets' exists, this is
# where the tweets will be archived
wdir = 'C:\Tweets'
user = sys.argv[1]
id_file = user + '_id.txt'
search_file = user + '.txt'

if os.path.exists(wdir + '\\' + id_file):
	f = open(wdir + '\\' + id_file, 'r')
	since = int(f.read())
	f.close()
else:
        since = 714461630445002756


#-----------------------------------------------------------------------
# load our API credentials 
#-----------------------------------------------------------------------
config = {}
execfile("config.py", config)

#-----------------------------------------------------------------------
# create twitter API object
#-----------------------------------------------------------------------
twitter = Twitter(
		auth = OAuth(config["access_key"], config["access_secret"], config["consumer_key"], config["consumer_secret"]))


#-----------------------------------------------------------------------
# query the user timeline.
# twitter API docs:
# https://dev.twitter.com/rest/reference/get/statuses/user_timeline
#-----------------------------------------------------------------------
results = twitter.statuses.user_timeline(screen_name = user,since_id=since,count=200)

allResults = results
while (len(results) != 0 and len(allResults)<6000):
  print results[len(results)-1]['id']-1
  results= twitter.statuses.user_timeline(screen_name=user,count=200,since_id=since,max_id=results[len(results)-1]['id']-1)
  allResults += results

# write tweets to file
if len(allResults)>0:
  f = open(wdir + '\\' + search_file, 'a+')

#-----------------------------------------------------------------------
# loop through each status item, and print its content.
#-----------------------------------------------------------------------
  for status in allResults:
    if int(status["id_str"])>since:
      since = int(status["id_str"])

    output = str(status["created_at"])
    output += '\t' + status["id_str"]
    output += '\t' + myClean(status["text"].encode("ascii", "ignore"))
    output += '\t' + str(status['retweet_count'])
    output += '\t' + status['user']['screen_name'] 
    try:
     url=status['entities']['urls'][0]['expanded_url']
     output += '\t' +url+ '\n'
    except Exception, e:
     output += '\n'
        
    f.write(output)

  f.close()
 
  # write last id to file
  f = open(wdir + '\\' + id_file, 'w')
  f.write(str(since))
  f.close()
else:
  print 'No new tweets for ' + user 
