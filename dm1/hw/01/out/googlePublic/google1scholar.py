#python2.7
#Tony Breitzman - abreitzman@1790analytics.com
#May 1, 2013

import simplejson
import sys
import datetime
import os
from apiclient.discovery import build


searchName = sys.argv[1]
qq = sys.argv[2]
wdir = 'C:\google'


config = {}
execfile("config.py", config)

devKey = config["GdevKey"]
devcx = config["GSdevcx"]

def removeNonAscii(s): return "".join(i for i in s if ord(i)<128)

def myClean(s):
  s = removeNonAscii(s)
  s = ' '.join(s.split())
  return s

def printItems(f,res,myIndex):
  for item in res['items']:
    l = searchName + '\t' + str(myIndex) + '\ttitle\t' + myClean(item['title'])+ '\n'
    f.write(l)
 #   l = searchName + '\t' + str(myIndex) + '\tformattedUrl\t' + item['formattedUrl'] + '\n'
 #   f.write(l)
 #   l = searchName + '\t' + str(myIndex) + '\thtmlFormattedUrl\t' + item['htmlFormattedUrl'] + '\n'
 #   f.write(l)
    l = searchName + '\t' + str(myIndex) + '\tsnippet\t' + myClean(item['snippet']) + '\n'
    f.write(l)
    l = searchName + '\t' + str(myIndex) + '\tlink\t' + item['link'] + '\n'
    f.write(l)
    myIndex = myIndex + 1
  
def main():
  # Build a service object for interacting with the API. Visit
  # the Google APIs Console <http://code.google.com/apis/console>
  # to get an API key for your own application.
  service = build("customsearch", "v1",
            developerKey=devKey)

  
  res = service.cse().list(
      q=qq,
      cx=devcx,
      start=1
    ).execute()

  f = open(wdir + '\\' + searchName + '.txt', 'w')
  l = 'fileName\tRecord\tFieldHeading\tData\n'
  f.write(l)
  l = searchName + '\t' + '0' + '\tSearchTerms\t' + res['queries']['request'][0]['searchTerms']+'\n'
  f.write(l)
  
  count = res['queries']['request'][0]['totalResults']
  l = searchName + '\t' + '0' +'\tResults\t' + str(count) + '\n'
  f.write(l)
  l = searchName + '\t' + '0' + '\tTimeStamp\t' + str(datetime.datetime.now()).split('.')[0] + '\n'
  f.write(l)
  
  printItems(f,res,1)

  if count > 10:
    res = service.cse().list(
      q=qq,
      cx=devcx,
      start=11
    ).execute()

    printItems(f,res,11)

  if count > 20:
    res = service.cse().list(
      q=qq,
      cx=devcx,
      start=21
    ).execute()

    printItems(f,res,21)

#  if count > 30:
#    res = service.cse().list(
#      q=qq,
#      cx=devcx,
#      start=31
#    ).execute()

#    printItems(f,res,31)


#  if count > 40:
#    res = service.cse().list(
#      q=qq,
#      cx=devcx,
#      start=41
#    ).execute()

#    printItems(f,res,41)

  f.close()
    
if __name__ == '__main__':
  main()
