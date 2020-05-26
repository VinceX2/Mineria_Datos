# Practice 5

> The first step is to load our CSV file and save it in a variable and proceed to look at the data contained in the csv
```scala
stats <- read.csv(file.choose())
stats
```
* Filter countries by Low income
```scala
stats[stats$Income.Group == "Low income",]
```

* Filter countries by Lower middle income
```scala
stats[stats$Income.Group == "Lower middle income",]
```

* Filter countries by Upper middle income
```scala
stats[stats$Income.Group == "Upper middle income",]
```

* Filter by countrie Malta
```scala
stats[stats$Country.Name == "Malta",]
```

* Filter by countrie Qatar
```scala
stats[stats$Country.Name =="Qatar",]
```

* Filter by countrie Netherlands
```scala
stats[stats$Country.Name =="Netherlands",]
```

* Filter by countrie Norway
```scala
stats[stats$Country.Name =="Norway",]
```