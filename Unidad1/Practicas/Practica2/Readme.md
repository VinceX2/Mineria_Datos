# Practice 2

## Functions in R

n <- dnorm(x = 10000, mean = 0, sd = 1, log = FALSE)
n

a <- 100
length(a)

quantile(a)

## 20 functions

* Redondea los decimales hacia el numero siguiente
```R
ceiling(3.475) # 4
```
* Redondea el numero al numero su numero menor
```R
floor(3.475) # 3
```
* razi cuadrada 
```R
sqrt(9) # 3
```
* substrae de una variable los indices indicados
```R
x <- "abcdef"
substr(x, 2, 4) # bcd
```
*  Distribucion binomial
```R
dbinom(0:5, 10, .5)
```
* Distribucion uniforma
```R
dunif(10, min=0, max=1)
```
* Crea variables uniformes aleatoriamente
```R
punif(10, min=0, max=1)
```
* mediana
```R
mean(10,na.rm = FALSE)
```
* lagged differences, with lag indicating which lag to use
```R
diff(45, lag=1)
```
* repite los nuemros del 1-3 2 veces
```R
rep(1:3, 2)
```
