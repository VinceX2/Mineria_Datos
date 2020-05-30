getwd()
setwd("/Users/VinceLAB/Documents/ITT /Ene - Jun 2020/Mineria/ProfeRepo/MachineLearning/MultipleLinearRegression")
getwd()

# Importing the dataset
dataset <- read.csv('50_Startups.csv')

# Encoding categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = training_set )
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred

# Visualising the Training set results
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
