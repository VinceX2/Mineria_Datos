## Multiple Linear Regression

> Multiple linear regression is an extension of simple linear regression used to predict an outcome variable (y) on the basis of multiple distinct predictor variables (x).

We're following the algorithm of simple linear regression in R

### Algorithm in R

The first things to do is import the dataset into a dataframe to manipulate the data in a easy way.

```r
dataset <- read.csv('50_Startups.csv')
```

We need to change the type of data for the field State in order to manipulate.

```r
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
```

After of convertion the dataset we're almost ready to start the algorithm, next thing is split the data in 2 parts one for testing dataframe and the other for training dataframe.

```r
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

Now we're able to implement the algotirhm, to do that we need first defined the formula and the dataset that we'll use in the algorithm, all this stuff inside a variabel called regressor.

```r
regressor = lm(formula = Profit ~ R.D.Spend,
               data = training_set )
summary(regressor)
```

Then, we need to create the prediction using the Predict function with the testing dataset.

```r
y_pred = predict(regressor, newdata = test_set)
y_pred
```

At this point, we're almost finish with the algorithm but first we need to show the data in a visual way using the library ggplot() to generate an graphic.

```r
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$Profit, y=training_set$R.D.Spend),
             color = 'red') +
  geom_line(aes(x = training_set$Profit, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Profit vs R.D.Spend (Training Set)') +
  xlab('Profit') +
  ylab('R.D.Spend')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$R.D.Spend, y=test_set$Profit),
             color = 'red') +
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Profit vs R.D.Spend (Testing Set)') +
  xlab('Profit') +
  ylab('R.D.Spend')
```

### Results

![Multiple-Linear-Regression](results.png)
