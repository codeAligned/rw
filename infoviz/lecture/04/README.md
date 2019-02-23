# Lecture 03

20190207: Lecture compries of 3 parts:

- Student presentation of [Storytelling:The Next Step for Visualization](../../papers/0207_StoryTellingTableau.pdf)
- SQLLite

## Student Presentation - Tour of Visual Zoo

1,200 Exabytes data being generated

5 Ways view data

- Time-series data
    + Finance
    + Science
    + etc
- Graphs
    + index charts
    + stacked graphs
    + small multiples
    + Horizon graphs
- Statistical distributions - histogram
    + Stem-Leaf Plot 9 | 99
    + QQPlot - plot linear are similar
    + SPLOM scatter plot matrix
    + Parallel Coordinates - multi color important
- MAPS
    + 3D World on 2D Space - Napoleon March on Moscow
    + Choropleth maps - states by Color
    + Graduated symbol map - pie charts for each state sized by population
    + cartogram maps - stattes as bubbles by circle
- Heirarchies
    +  Node-Link Diagram (parent/child with root)
        * Radial
        * Linear Horizontal
        * Linear  Vertical
    + Adjacency Diagrams - Size of importance of the data
        * Linear (Icicle Tree)
        * Radial (sunburst)
    + Treemap Layout - 
    + Nested Circles - good for seeing all relationships quick
- Newtork Layout
    + Attract / Repel to position nodes
    + Arc Diagram
    + Matrix Views

Q&A:

What software used.  A: Varies - some work in Tableau.
D3 is coming up.

## Clean Your Data

Why is data dirty?

- collection errors
- entropy

Process

1. Collect
2. Explore
3. Clean
4. ...

- entry errors
- measurements error
- translation errors
- storage errors - dropouts
- multiple people working on same thing
- time lapse error

- missing data
- data linking errors
- spelling errors
- duplicate data
- outdated data
- data hacked and changed
- origin / identity not clear
- overfit training data (could make sparse model not work)

Examples of Training

80% Time spent on Data Prep - pie chart with 60% cleaning

## Data Cleaners

- Data Wrangler
- Open Refine - With Google Refine 

Watch videos, write down 
- examples of data dirtiness
- tool features

Google Refine:

- Text Facet - groups identical rows together
- Clustring Feature - helps merge groups
- Numeric Facet - Log Value to handle large valid numeric

Google Refine - see big picture 

Can download / run install 

Example Film Fare List - import text file cut from web page

isolate rows using filters or facets
apply tranform to isolagted

OpenRefine.github.com

Cleanup

Transform

Incompleate?
- augment data with data from url

Reconciliation to enrich data with precised identities

## Stanford Tool: Data Wrangler

what can tools do

o identify similar words
o w history in W: script
o clustering
o show the impact of changes 
o w transformation
o w offline processing
o highlight outliers
w "pivoting"
w previewing
w extract part of word 
w histogram/vis for each column
w suggest operations

## Openrefine Expression Language (GREL)

value.split(" ")[1] == "Smith"; "Doe"

? Does this exmple get applied as a rule for all the remaining rows?

## GREL

substr index start with 1 not 0

## Array Syntax

## Controls




