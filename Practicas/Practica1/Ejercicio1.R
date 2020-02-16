##1. Initialize sample size
n<-10000000 
##2. Initialize counter
c<-0

##3. loop for(i in rnorm(size))
##I don't know very well if that's how rnorm is declared
for(i in rnorm(n, mean=0,sd=1)) {
  if(i >= -1  && i <= 1) {
    c <- c + 1
  }
}

result <- c / n
result
