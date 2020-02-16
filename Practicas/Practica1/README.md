#  Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:

Knowing that the mean (Xn) -> E (X) find E (X) = 68.2% for numbers that are between -1 to 1

* Initialize the sample size "n" and the counter "c"
```scala
n<- 10000000
c<-0
```

* We build the loop for with a normal distribution with the size of our sample
```scala
for(i in rnorm(n, mean = 0, sd=1 )){
}
```