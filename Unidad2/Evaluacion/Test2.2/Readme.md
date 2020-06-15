# Test 2.2

The first things to do is import the dataset into a dataframe to manipulate the data in a easy way. And select the desire columns that we'll work on them.

```R
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```

We need to transform the value of Purchased column into a boolean value to manipulate the column.

```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

We're ready to split our dataset into 2 samples, one for training and the other for testing using the purchased column.

```R
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

We need to scale the features because the algorithm doesn't do it for us

```R
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```

In this parts we're fitting naive bayes to training set

```R
classifier = naiveBayes(formula = Purchased ~ .,
                        data = training_set,
                        type = 'raw',
                        laplace= 3)
```

We made the preditictions using the test set

```R
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```

Make the confusion metrix using the test set

```R
cm = table(test_set[, 3], y_pred)
confusionMatrix(cm)
```

Then, we're ready to visualize the predictions using the ElemStatLearn library. 
Using the test set results.

```R
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

## Plot

![plot1](plot.png)

## Analysis

Based on the results using the naive bayes algorithm and plotting the data, we can end that categorical data used in this algorithm show the predictions if some people purchased something also we have  others columns such as age and estimated salary. Looking the graph we seeing that the green background there're the ones whose purchased the ads and the red ones whose not purchased the ads. In other words, we could say that who has more salary and more age could but something because he could but someones who has a young age and low salary maybe couldn't afford the ads but if we think in some other reason or we tried to get other meaning about this data we could say that maybe the older people are more careful about their money and they don't trust anything on the internet so for that they won't buy that ads, by other hand the young people maybe are more relaxed or careless when they're using the internet so they could buy something more easy than the older people.
