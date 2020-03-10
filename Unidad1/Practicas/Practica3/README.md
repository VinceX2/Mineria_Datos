# Practice 3

* we load the data to its variables
```scala
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
 ``` 
* We calculate earnings as the differences between income and expenses
```scala
profit <- revenue  - expenses
profit
```
* We calculate the tax as 30% of the benefit and round it to 2 decimal points using the round function **round()**
```scala
tax <- round(0.30 * profit, digits = 2)
tax 
```

* Calculate Profit Remaining After Tax Is Deducted
```scala
profit.after.tax <- profit - tax
profit.after.tax
```

* we calculate the profit margin as profit after income taxes, round up to 2 decimal points, then multiply by 100 to get the%
```scala
profit.margin <- round(profit.after.tax / revenue , digits=2) * 100
profit.margin
```

* Calculamos la ganancia media después de impuestos para los 12 meses utilizando la funcion **mean()**
```scala
mean_pat <- mean (profit.after.tax)
mean_pat
```

* We find the months with higher than average earnings after taxes
```scala
good.months <- profit > mean_pat
good.months
```

* Bad Months Are The Opposite Of Good Months !
```scala
bad.months <- profit < good.months
bad.months
```

* The best month is where the profit after tax was equal to the maximum for this we make use of the function **max()**
```scala
best.month <- profit.after.tax == max(profit.after.tax)
best.month
```


* The worst month is where the profit after tax was equal to the maximum for this we make use of the function **min()**
```scala
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month
```

* Convert All Calculations To Units Of One Thousand Dollars
```scala
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses /1000 , 0)
profit.1000 <- round(profit/1000 , 0)
profit.after.tax.1000 <- round(profit.after.tax/1000 , 0)
```

* Print Results
```scala
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month
```

* BONUS:
* Preview Of What's Coming In The Next Section
```scala
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

#Print The Matrix
M
```