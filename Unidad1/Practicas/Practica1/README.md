# The Law Of Large Numbers for N random normally distributed

_We need to create a script that will count how many of these numbers fall between -1 and 1 then we will divide them by the total quantity of N._

#### Parameters for the Normally Distributed

- **Mean** = 0
- **Standard distribution** = 1

#### Requirements

- We know that the E(X) = 68.2%
- Check that Mean(Xn) -> E(X)

#### Code

> We initialize the sample size variable with one million of numbers and the counter at zero.

```r
n<- 10000000
c<-0
```

> We created a for loop that will iterate the results of the `rnorm()` function with the parameters that we have.

```r
for(i in rnorm(n, mean = 0, sd=1 )){}
```

> Inside the for loop we added an if statement with a condition if i is between -1 and 1. If condition is true we will increment the counter plus one.

```r
if(i >= -1  && i <= 1) {
    c <- c + 1
  }
```

> Finally, we assigned the result of the next operation into a variable.

```r
result <- c / n
```
