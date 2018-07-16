# twitter_ron.py - see README.md for details
import requests
from requests_oauthlib import OAuth1
import cnfg
import os
config = cnfg.load(".twitter_config")
oauth = OAuth1(config["consumer_key"],
               config["consumer_secret"],
               config["access_token"],
               config["access_token_secret"])

response = requests.get("https://api.twitter.com/1.1/statuses/user_timeline.json", 
                        auth=oauth)
tweets = response.json()

with open('./download/response_keys.txt', 'w') as f:
    for key in tweets[0].keys():
        f.write(key + '\n')

with open('./download/my_tweets.txt', 'w') as f:
    for tweet in tweets:
        f.write(tweet['text'].encode('utf-8') + '\n')

search_url = "https://api.twitter.com/1.1/search/tweets.json"
parameters = {"q": ["triumph comic"], "count":400}
response = requests.get(search_url, params = parameters, auth=oauth)
with open('./download/triumph_comic_dog_tweets.txt', 'w') as f:
    for tweet in response.json()[u'statuses']:
        f.write(str(tweet['id']))
        f.write(tweet['text'].encode('utf-8') + '\n')
    for i in range(3): # 3 pages of results
        next_page_url = search_url + response.json()['search_metadata']['next_results']        
        for tweet in response.json()['statuses']:
            f.write(str(tweet['id']))
            f.write(tweet['text'].encode('utf-8') + '\n')
