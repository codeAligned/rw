from twitter import *

config = {}
execfile("config.py", config)

#-----------------------------------------------------------------------
# create twitter API object
#-----------------------------------------------------------------------
t = Twitter(auth = OAuth(config["access_key"], config["access_secret"], config["consumer_key"], config["consumer_secret"]))

x = t.application.rate_limit_status()


print("lookup "+str(x['resources']['search']['/search/tweets']))
print("timeline "+str(x['resources']['statuses']['/statuses/user_timeline']))
print("search "+str(x['resources']['users']['/users/search']))
print("rateLimit"+str(x['resources']['application']['/application/rate_limit_status']))

