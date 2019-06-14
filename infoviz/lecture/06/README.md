# Lecture 06 - 20190307

Class next Thursday 3/14  
No class 3/21  
Open refine homework due 3/21

## OpenRefine Hands On Practices

Classroom

Zip file and tutorial.pdf.

E:\home\rneely\rn\rw\infoviz\lecture\06\package\louisiana-elected-officials.csv

## OpenRefine Homework (10 pts.)

# Paper Presentations (2)

## Visual Analytics: Definition, Process, and Challenges Paper Summary

[Paper](../../papers/0307_Visual Analytics- Definition, Process, and Challenges.pdf) 


Robert Reeders, Edward Carter, Nicholas Mariani

- Challenges
    + sources for data are increasing

Information Overload -> Opportunity

### Visual Analytics (VA)

Data -> Visualization and Models -> Knowledge

### Areas Used

Machine learning  + Human Cognition

- demographic graphs
- data management
- data analysis
- perception and cognition
- human-computer interaction
- infrastructure and evaluation

### Scalability

### Quality of data

- Analysts can misinterpret data
    + Uncertainty
    + Limitations
    + Errors in input data
    + Chosen algorithms used
- User should be aware of uncertainties

### Visual Representations

- Selecting fine details to provide a global overview can prove difficult
- Patterns and relationships need to be visualized on many levels of detail
- appropriate level of data

### User Interfaces

- UI must be easy to use
    + user should be focus on tasks

### Display Devices

- must adapt to available display options
    + Large scale walls to small portable devices
    + what can audiences see
    + what ...

### Evaluation

- No evaluation framework exists
    + visual analytics has a complex and heterogeneous problem domain
    + ...

### Infrastructure

    + Smooth interactions needed (memory, dis, graphics card, algorithm efficiency

### Applications

VA can process vast amounts of data: i.e.  cell phone GPS.

Show graph

Paper: geo map

Temporal histogram: distribution of stops

map showing flow with different size arrows on map

### Example: international flight data

too much data

limit to u.s. and asia

### VA

computation + human intuition

=> interactive visualization

validate visual analytics via user case study

# Data Wrangling Paper

Paper [pdf](../../infoviz/papers/0228_2011-DataWrangling-IVJ.pdf)

Tom, Jeff, ..

### What is data wrangling

 - raw data -> analytics
 - data munging

### Research Directions in Data Wrangling

- visualization could speed up cleaning data

### Existing issues

- data relevance
- data format
- time investment to change formats
- missing data
- inconsistencies
- duplicate data
- transformation
- cleaning

~ 80% time dn cost

- discourages people from engaging some data sets

### Issues Summary

- More time spent wrangling data than studying it
- Imposes a needless learning curve
- removing cleaning curve allows more people to analyze

### Visualization pros

algorithmic
- duplicate removal
- schema matching
    + compare tables for relations
- entity resolution
    - disambiguation

### Visualization cons

- dirty data can be difficult to visualize

connection maps

data aggregations

heat map of bins

### Data at scale

- use hexagonal 2d bins
    + improves density estimates
- use good color schemes
- sampling
    + confidence interval
    + no need for complete dataset

### Automation

- Algorithms
    + find discrepancies and outliers
- Validation Routines
    + RegEx patterns
- Complex Data Mining
- Active Learning
    + data dirty or missing?

### Visualizing missing data

- 0
- blank
- fade
- interpolate

5 types uncertainty

- measurements precision
- completeness
- inference
- disagreement
- credibility

### Glyphs

### Transforming Data

various tools

### Correcting Erroneous Values

- batch process
- fill in
- interpolate


### Mergings

schema matching imports

### Editing and Auditing Transformation

Need scripts to keep up with needed transformations

### Modification and Reuse

Code your data cleaning to be reused.
