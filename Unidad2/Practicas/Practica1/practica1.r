getwd()
setwd("/Users/VinceLAB/Documents/ITT /Ene - Jun 2020/Mineria/RepoGitHub/MineriaRepo/Unidad2/Practicas/Practica1")
getwd()

# Importing the dataset
dataset <- read.csv('CarDataSet.csv')

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$price, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = horsepower ~ price,
               data = dataset)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$price, y=training_set$horsepower),
             color = 'red') +
  geom_line(aes(x = training_set$price, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Price vs Horsepower(Training Set)') +
  xlab('Price') +
  ylab('Horsepower')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$price, y=test_set$horsepower),
             color = 'red') +
  geom_line(aes(x = training_set$price, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Price vs Horsepower(Training Set)') +
  xlab('Price') +
  ylab('Horsepower')
