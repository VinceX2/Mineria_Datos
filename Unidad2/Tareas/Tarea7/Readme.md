# Real-Time Human Pose Recognition in Parts from Single Depth Images

## Introduction
<div style="text-align: justify">
Recognition of human body parts was possible but it was complicated since there were no deep recognition cameras. This changed with the arrival of the Xbox 360 kinect, which had the computational capacity to run at 200 frames per second, but had the problem of recognizing parts of the human body in real time without having much computational cost, without losing efficiency and having a good appreciation.
<div>

## Development

### Classification method used

<div style="text-align: justify">
The method used was Random Forest, this classification method offers a quick and efficient classification when comparing the image of our body with the large image database.
<div>

### Complications

<div style="text-align: justify">
The complications that were found are not reaching the overfitting, so as not to harm the interaction in real time, it was found that reaching a depth of 20 in the tree, the overfitting begins to be reached, but at a depth of 10 it is not reached. of overfit, many training images are not used compared to the depth of 20 and a good result is achieved.

Compared with the K-neighborhood algorithm, it has a better performance of thousandths of a second, with K-neighborhood you have to find the images 5 cm apart from the joints and fill in the spaces depending on the results.
<div>

## Conclusion

<div style="text-align: justify">
The good use of classification algorithm, in this case Random-Forest can be made good classification by performing a good analysis of the problem and having a good training database, performing tests and readjusting our parameters evaluating required times and without reaching an overfit.
<div>

## Reference:

[Real-Time Human Pose Recognition in Parts from Single Depth Images](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/BodyPartRecognition.pdf?fbclid=IwAR0a4MXPsL9lbVEBR6nF7pu31wEL0kocmwp8_ODfwZ0y0O6iu-VnhUJw45o "Real-Time Human Pose Recognition in Parts from Single Depth Images")