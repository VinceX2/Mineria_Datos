n <- dnorm(x = 10000, mean = 0, sd = 1, log = FALSE)
n

a <- 100
length(a)

quantile(a)

?dnorm()
data <- seq(1,100, 1)

dnorm(data,0, 1)

?pnorm()
pnorm(data,0, 1)

# 20 Fucntions

# 1
ceiling(3.475) 
# 2
floor(3.475)
# 3
sqrt(9)
# 4
x <- "abcdef"
substr(x, 2, 4) 
# 5
dbinom(0:5, 10, .5)
# 6
dunif(10, min=0, max=1)
# 7
punif(10, min=0, max=1)
# 8
median(10,na.rm = FALSE)
# 9
diff(45, lag=1)
# 10
rep(1:3, 2)
# 11
?length()
length(data)
# 12
?exp()
exp(23)
# 13
?log()
log(23, base = exp(3))
# 14
?cat()
Holamundo <- cat("H", "e","l", "l", "o", sep = ",")
# 15
is.numeric(Holamundo)
# 16
is.integer(Holamundo)
#17
is.double(Holamundo)
# 18
is.character(Holamundo)
# 19
typeof(Holamundo)
# 20
?ls()
ls()