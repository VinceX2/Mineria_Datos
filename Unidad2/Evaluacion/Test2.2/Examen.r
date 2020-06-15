# We set up our workspace
getwd()
setwd("/Users/VinceLAB/Documents/ITT /Ene - Jun 2020/Mineria/RepoGitHub/MineriaRepo/Unidad2/Evaluacion/Test2.2")
getwd()

# We need to import the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

summary(dataset)
head(dataset)

# We need to transform the value of Purchased column into a boolean value to manipulate the column.
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

dataset
summary(dataset)
head(dataset)

# We're ready to split our dataset into 2 samples, one for training and the other for testing using the purchased column.
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# We need to scale the features because the algorithm doesn't do it for us
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

head(training_set)

# Fitting naive bayes to the Training set
library(e1071)
classifier = naiveBayes(formula = Purchased ~ .,
                        data = training_set,
                        type = 'raw',
                        laplace= 3)
classifier

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
# Showing performance data of the prediction
library(caret)
confusionMatrix(cm)

# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
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
