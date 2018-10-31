# HW6: Project Proposal

Due Tuesday by 11:59pm Points 5 Submitting a text entry box or a file upload

In a page or less flesh out your 1 sentence idea from last week.  describe what you are going to do for the end of term project.  Answer the following:

## 1. Who is on the team? (could be just you or up to 3 people including you)

Just me. Ron Neely. Hi.

## 2. Statement of the problem and How you plan on solving it.

This project will predict possible fishing port congestion along with recommendations for optimizing fishing port unloading and offloading specifically for the Port Authority of New Bedford, MA.  The idea is similar to predictive analytics that are being used for the container port of Long Beach, CA as described in this [article](https://www.ship-technology.com/features/predictive-analytics-new-hot-ticket-shipping/) by Joe Baker.  New Bedford has different needs than Long Beach.


## 3. What data will you use and how will you get it?

AIS data will be acquired from [marinecadastre.com](http://www.marinecadastre.com).
There is a huge amount of data available here.  I plan to only focus on zones 18 and 19 which represent most of the eastern seaboard of the United States.
Data is available from 2009 until 2017 however some of the middle years may be encrypted, a.k.a. not able to be used.

New Bedford fish market price data has also been requested from [baseseafood.com](http://www.baseseafood.com), however I have not yet heard back from them.

## 4. What algorithms will you use

This project will:

- use pandas to help understand time related data
- use clustering and heat maps to explore and understand high traffic areas and potentially hot fishing spots
- create a predictive model for port arrival times from early track data which may involve simple statistical or clustering algorithms or Neural Nets.

## 5. How will you measure success

This project will be considered a success by presenting:

- heat map showing high traffic areas
- heat map showing hot fishing spots
- heat map showing port congestion
- a presentation showing success of predicting port arrival time from early track data.

## 6. What do you expect to present at the end of the term

A power point presentation of the above.
