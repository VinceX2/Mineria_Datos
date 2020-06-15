getwd()
setwd("/Users/VinceLAB/Documents/ITT /Ene - Jun 2020/Mineria/RepoGitHub/MineriaRepo/Unidad2/Practicas/Practica2")
getwd()

# Importing the dataset
dataset <- read.csv('movieRatings.csv')

dataset<-dataset[dataset$Genre=="Action"|dataset$Genre=="Adventure"|dataset$Genre=="Comedy",]
# Encoding categorical data 
dataset$Genre = factor(dataset$Genre,
                       levels = c('Action', 'Adventure', 'Comedy'),
                       labels = c(1,2,3))

dataset
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Budgetmillion, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)

regressor = lm(formula = Budgetmillion ~ AudienceRatings,
               data = training_set )
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$AudienceRatings, y=training_set$Budgetmillion),
             color = 'red') +
  geom_line(aes(x = training_set$AudienceRatings, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('AudienceRatings vs Budgetmillion (Training Set)') +
  xlab('AudienceRatings') +
  ylab('Budgetmillion')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$AudienceRatings, y=test_set$Budgetmillion),
             color = 'red') +
  geom_line(aes(x = training_set$AudienceRatings, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('AudienceRatings vs Budgetmillion (Testing Set)') +
  xlab('AudienceRatings') +
  ylab('Budgetmillion')
