# Here is assignment 1.  

## Part A. Choose Only 1 of the following

1.Create an API Key for Google+ and get one of my programs working on your system to dump a bunch of 
web sites for some search term
2.Write something to do the same for Bing or an alternative search site

## Part B. Also Choose Only 1 of the following

1.Download the twitter API keys and use one of my programs to download all of the tweets related to a 
keyword, hashtag, or screen name.
2.Use the API to do something completely different like:
a)Given a screen name, list all of its followers
b)Find the trending topics
c)Given a tweet, find all the times it has been retweeted
d)Anything else, as long as it uses the API

## Deliverables: Output of google search program (topic of your choice).  Output of several tweets from 
twitter handle of your choice or search topic or equivalent. Source code if you modified my code.
Note:  Doing the above is worth 9 out of 10 points.  To get the 10th, do something extra like write your 
own program or do something with the twitter API that my code doesn't do, or convert my Python 2.7 to 
3.6 etc.  Don't go crazy and spend 10 hours on anything, but learn something!

## Work

### Python 2 vs 3

My home laptop has two different anaconda prompts in the start menu:
- 'Anaconda Prompt (Python2)'
- 'Anaconda Prompt' (Python3)

One can use PIP to create a requirements.txt file.  This could work with vs code.
pip reqs: https://stackoverflow.com/a/31684470

    # pip install pipreqs
    pipreqs /path/to/project

creates requirements.txt file, then

    pip install -r requirements.txt


### Enabling API
https://console.developers.google.com/projectselector/apis/credentials?supportedpurview=project

https://conda.io/docs/user-guide/tasks/manage-environments.html

google custom search engine key
https://developers.google.com/custom-search/json-api/v1/overview

https://support.google.com/googleapi/answer/6158849

Added google custom search engine [cse](cse.google.com)
for [thefisherman.com](www.thefisherman.com) with a search engine id of 011038953564469948749:nfshlg3olz0.

Results [here](https://cse.google.com/cse/create/congrats?cx=011038953564469948749%3Anfshlg3olz0) include:

- [Add it to your site](https://cse.google.com/cse/create/getcode?cx=011038953564469948749%3Anfshlg3olz0) javascript code
- [View it on the web](https://cse.google.com/cse/publicurl?cx=011038953564469948749:nfshlg3olz0)
- [Settings](https://cse.google.com/cse/setup/basic?cx=011038953564469948749%3Anfshlg3olz0)

Uses schemas from [schema.org](https://schema.org/).

https://developers.google.com/custom-search/docs/overview

https://developers.google.com/custom-search/json-api/v1/overview

Api key: https://console.developers.google.com/apis/credentials?project=rw-dm1&authuser=0

https://developers.google.com/custom-search/json-api/v1/libraries

https://developers.google.com/api-client-library/python/

Example in python 2 command propmpt:
```cmd
pip install --upgrade google-api-python-client 
```
The first part of the assignment is to create 5 google custom search engines via [cse.google.com](https://cse.google.com) that are named according to 
[searchEngineSpecs.txt](./out/googlePublic/searchEngineSpecs.txt). Then use the Goggle+ api to call them. Specifically each google customer search engine will be named:

- googlePat
- linkedIn
- PressRelease
- general
- Science

Still doesn't work, get

```
Traceback (most recent call last):
  File "c:\Users\user\Documents\ds\rw\dm1\hw\01\out\googlePublic\googlePats1.py", line 112, in <module>
    main()
  File "c:\Users\user\Documents\ds\rw\dm1\hw\01\out\googlePublic\googlePats1.py", line 48, in main
    developerKey=devKey)
  File "c:\Users\user\Documents\ds\rw\dm1\hw\01\out\googlePublic\oauth2client\util.py", line 128, in positional_wrapper
    return wrapped(*args, **kwargs)
  File "c:\Users\user\Documents\ds\rw\dm1\hw\01\out\googlePublic\apiclient\discovery.py", line 192, in build
    resp, content = http.request(requested_url)
  File "c:\Users\user\Documents\ds\rw\dm1\hw\01\out\googlePublic\httplib2\__init__.py", line 1570, in request
    (response, content) = self._request(conn, authority, uri, request_uri, method, body, headers, redirections, cachekey)
  File "c:\Users\user\Documents\ds\rw\dm1\hw\01\out\googlePublic\httplib2\__init__.py", line 1317, in _request
    (response, content) = self._conn_request(conn, request_uri, method, body, headers)
  File "c:\Users\user\Documents\ds\rw\dm1\hw\01\out\googlePublic\httplib2\__init__.py", line 1252, in _conn_request
    conn.connect()
  File "c:\Users\user\Documents\ds\rw\dm1\hw\01\out\googlePublic\httplib2\__init__.py", line 1044, in connect
    raise SSLHandshakeError(e)
SSLHandshakeError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:590)
```

Perhaps adding the following to requriements.txt:

    gapy==1.3.6 
    google-api-python-client==1.4.2 
    httplib2==0.11.3 
    oauth2client==1.5.2 

followed by

    pip install -r requirements.txt

Unzipped file from Dr. Brietzman and installed in directory.
Still got this error:
(Python2) C:\Users\user\My Documents\ds\rw\dm1\hw\01\out\googlePublic>pip install httplib2
Requirement already satisfied: httplib2 in c:\users\user\anaconda3\envs\python2\lib\site-packages (0.11.3)

(Python2) C:\Users\user\My Documents\ds\rw\dm1\hw\01\out\googlePublic>python googlePR1.py photoVoltPrintElecPR "photovoltaic \"printed electronics\""
Traceback (most recent call last):
  File "googlePR1.py", line 112, in <module>
    main()
  File "googlePR1.py", line 49, in main
    developerKey=devKey)
  File "C:\Users\user\My Documents\ds\rw\dm1\hw\01\out\googlePublic\oauth2client\util.py", line 128, in positional_wrapper
    return wrapped(*args, **kwargs)
  File "C:\Users\user\My Documents\ds\rw\dm1\hw\01\out\googlePublic\apiclient\discovery.py", line 192, in build
    resp, content = http.request(requested_url)
  File "C:\Users\user\My Documents\ds\rw\dm1\hw\01\out\googlePublic\httplib2\__init__.py", line 1694, in request
    (response, content) = self._request(conn, authority, uri, request_uri, method, body, headers, redirections, cachekey)
  File "C:\Users\user\My Documents\ds\rw\dm1\hw\01\out\googlePublic\httplib2\__init__.py", line 1434, in _request
    (response, content) = self._conn_request(conn, request_uri, method, body, headers)
  File "C:\Users\user\My Documents\ds\rw\dm1\hw\01\out\googlePublic\httplib2\__init__.py", line 1354, in _conn_request
    conn.connect()
  File "C:\Users\user\My Documents\ds\rw\dm1\hw\01\out\googlePublic\httplib2\__init__.py", line 1127, in connect
    raise SSLHandshakeError(e)
httplib2.SSLHandshakeError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:590)



## Twitter Part

Refer to [twitter_ron](./out/twitter_ron/README.md) project for twitter part.

This part was **not** completed with

    pip install python_twitter

# https://python-twitter.readthedocs.io/en/latest/

Rather, it was completed with the straight *requests* library.

https://colab.research.google.com/
