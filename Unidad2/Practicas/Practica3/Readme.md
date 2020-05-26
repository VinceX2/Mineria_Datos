# Homework analise the follow atomation backwardElimination function 
```R
# receives the training_set and SL significance level
backwardElimination <- function(x, sl) {
# get the length of the dataset
  numVars = length(x)
  # initializes the for loop to 1 up to the dataset size
  for (i in c(1:numVars)){
    # We use the formula notation to specify that Profit will be the dependent variable and that all other columns are independent.
    # and we assign our dataset
    regressor = lm(formula = Profit ~ ., data = x)
    # from the regression we obtain the highest coefficients when Pr is greater than t
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
        # it is done the same as the previous step to find the coefficient that was found previously
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
training_set
# we send the dataset and the SL to the function
backwardElimination(training_set, SL)
```