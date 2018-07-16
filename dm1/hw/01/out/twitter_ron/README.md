# twitter_ron

Example using twitter api 1.1.  Run in Python 2.7.
This code goes beyond what the DM1 class TwitterPublic does.
It directly uses requests and direclty records response keys in response_keys.txt. 


Setup:

1. Create a twitter account, i.e. mine is AltRon, a.k.a. @AltLearnRon
2. Create a new app via [apps.twitter.com](https://apps.twitter.com/) to create api keys.  Don't forget to modify access to read, write and access direct messages.  Create and access tokens.  Save these keys in .twitter_config in your home directory.
3. From cmd: `pip install -r requirements.txt`
4. From cmd: `python twitter_ron.py`

## output
Output is comprised of the following files in `./download`:

- my_tweets.txt
- response_keys.txt
- triumph_comic_dog_tweets.txt


## api documentation
Twitter api dox can be found [here](https://developer.twitter.com/en/docs/api-reference-index).



