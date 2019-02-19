# Lecture 03

20190207: Lecture compries of 3 parts:

- Student presentation of [Storytelling:The Next Step for Visualization](../../papers/0207_StoryTellingTableau.pdf)
- SQLLite
    + Lecture [pdf](SQLite.pdf)
    + Lab [pdf](SQLiteHandon.pdf)
- [HW1](../../hw/hw1/README.md) on SQLite assigned.
- Announcment: TODO: Progress presentations: end February 2/28 (Graph), early April

## Storytelling with Data Visualization 

Mike Leonchuck, Patrick Belko, and Dave Jefferson

### Background

- Data viz - early techniques
- Humans like stories - make understandable
- examples: news, powerpoint, movie, comic
- Facts become apparnet by viewing story.

### Methods

- Plaintext, video, etc.
- Tools used for analysis are not always best for visualization

### Early examples:

- Florence Nightengale - charts to explain
- John Snow - London cholera

### Story Telling

- martini class
- animation
- small embelllishments can help

### Presentations for a large audience

- independent viewing interaction can help

### Live Presentations

- great for large audiences
- business presentations, TED talks, etc.

### Individual/Small Groups

- more interaction between presenter and audience
- more ablity to answer

### Gapminder

- well known animated presentation
- bubble chards and scattersplots with varying point size
- watch distraction/engagement tradeoff

### Slideshow

- tell a story in steps

### Good story

- good story point
- temproal structure
- causual relationship

### Evaluation

- No well defined metric for a good story

What about audience engagement?

### Memory, Context and Embellishments

- color shock vs. normal for memory

### Interaction

- video games have most interaction - we tend to remember them well
- arguably best way to tell a story
- beware of distraction vs informing (i.e. side quests?)

### Other Disciplines

- choreography
- journalism

### Techniques

### Collaboration

- meant for an audience
- collaboration in visualization

### Conclusions

explore -> analyze -> display -> decision

### Q&A

keeping audience in mind is important

i.e. grandmom may not be into VR or AR but a 14 year old will

Data Visualization vs Visual Analytics

viz -> interpret -> conclusion < revise

HCI - Human Computer Interaction

## Simple Data Storage: SQLite

SQLite [Presentation](SQLite.pdf)

Dr. Bo (Beth) Sun

SQLite is software - to store data and parse it

SQLite - no sever requried, can use SQL on data

SQL great for downselecting and parsing data

Left table is students, right table is takes.

https://www.sql-join.com/sql-join-types/

```sql
select *
from student s
inner join course c
on s.id = c.id
```

```sql
select name from student, takes
where
    student.id = takes.id
    and takes.courseid = 6242;
```

### SQL General Form

views allows you to save data

```sql
create view view_name as
select a1,a1,... an
from t1, t2,... tm
where predicate
[order by ...]
[group by ...]
[having ...]
```

### SQL Index

SQL Indexes based on binary search trees

### SQL Vies

Why views?

View provide and abstraction layer over data?

Q. Can you use SQL to query views?

### Full text search [(FTS)](https://www.sqlite.org/fts3.html)

- for fast text-based querying
- uses virtual table
- other performance [SO:tip](https://stackoverflow.com/a/13696513)

'near' queries within 10 words
'near/2' within 2 words

### Install

- [Download](https://www.sqlite.org/download.html)
- unzip windows files all to same directory
- optional: include folder in system path

### Additional linkS

- Data Definition Languge [(DDD) and other terms](https://www.geeksforgeeks.org/sql-ddl-dml-dcl-tcl-commands/)
- SQL [Symbols](https://www.periscopedata.com/blog/sql-symbol-cheatsheet)
- [W3 Schools SQL Quick Ref](https://www.w3schools.com/sqlsql_quickref.asp)
- [SQL in 1 page](http://www.cheat-sheets.org/sites/sql.su)




