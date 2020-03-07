# Practice 2

## Functions in R

n <- dnorm(x = 10000, mean = 0, sd = 1, log = FALSE)
n

a <- 100
length(a)

quantile(a)

## 20 functions

* Round the decimals to the next number

```R
ceiling(3.475) # 4
```
* Round the number to the number your smallest number

```R
floor(3.475) # 3
```
* square root
 
```R
sqrt(9) # 3
```
* subtract indicator indices from one variable
```R
x <- "abcdef"
substr(x, 2, 4) # bcd
```
*  Binomial Distribution

```R
dbinom(0:5, 10, .5)
```
* Uniform distribution

```R
dunif(10, min=0, max=1)
```
* Create random variables randomly

```R
punif(10, min=0, max=1)
```
* mean
```R
mean(10,na.rm = FALSE)
```
* lagged differences, with lag indicating which lag to use
```R
diff(45, lag=1)
```
* repeat the numbers 1-3 2 times

```R
rep(1:3, 2)
```
