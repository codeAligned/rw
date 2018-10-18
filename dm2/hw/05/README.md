# HW 5 Submission to Kaggle - Digit Recognizer 

Due Sunday by 11:59pm Points 10 Submitting a text entry box or a file upload 

This is an easy but useful assignment.  It's one thing to get a predictive model working in R or Python, but to actually follow the specs to enter a contest is a useful next level problem.
For this assignment:

1. go to [kaggle](https://www.kaggle.com/c/digit-recognizer/data)
2. Build a model using the training data using any technique you like
3. Follow the directions to make a submission.
4. Take a screenshot or snip of your result on the leaderboard.

All on-time and complete submissions get at least an 8.  A score of .97 or above gets a 9. Anyone that beats .99471 gets a 10. Beating this particular benchmark is not hard.  It was my first submission score.  I was able to improve it with some tinkering (before I made it worse!)

A complete submission includes the aforementioned screenshot, the submitted .csv file, your code, and an .html, .doc, or .pdf file of your workbook or running program.

You may work with others, but each should make an individual submission to Kaggle (trust me it's good for you) and to Canvas

## Data 

### Description

The data files train.csv and test.csv contain gray-scale images of hand-drawn digits, from zero through nine.

Each image is 28 pixels in height and 28 pixels in width, for a total of 784 pixels in total. Each pixel has a single pixel-value associated with it, indicating the lightness or darkness of that pixel, with higher numbers meaning darker. This pixel-value is an integer between 0 and 255, inclusive.

The training data set, (train.csv), has 785 columns. The first column, called "label", is the digit that was drawn by the user. The rest of the columns contain the pixel-values of the associated image.

Each pixel column in the training set has a name like pixelx, where x is an integer between 0 and 783, inclusive. To locate this pixel on the image, suppose that we have decomposed x as x = i * 28 + j, where i and j are integers between 0 and 27, inclusive. Then pixelx is located on row i and column j of a 28 x 28 matrix, (indexing by zero).

For example, pixel31 indicates the pixel that is in the fourth column from the left, and the second row from the top, as in the ascii-diagram below.

Visually, if we omit the "pixel" prefix, the pixels make up the image like this:

```
000 001 002 003 ... 026 027
028 029 030 031 ... 054 055
056 057 058 059 ... 082 083
 |   |   |   |  ...  |   |
728 729 730 731 ... 754 755
756 757 758 759 ... 782 783 
```

The test data set, (test.csv), is the same as the training set, except that it does not contain the "label" column.

Your submission file should be in the following format: For each of the 28000 images in the test set, output a single line containing the ImageId and the digit you predict. For example, if you predict that the first image is of a 3, the second image is of a 7, and the third image is of a 8, then your submission file would look like:

```
ImageId,Label
1,3
2,7
3,8 
(27997 more lines)
```

The evaluation metric for this contest is the categorization accuracy, or the proportion of test images that are correctly classified. For example, a categorization accuracy of 0.97 indicates that you have correctly classified all but 3% of the images.