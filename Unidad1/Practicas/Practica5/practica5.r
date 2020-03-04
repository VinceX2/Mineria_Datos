stats <- read.csv(file.choose())
stats

#Filter countries by Low income
stats[stats$Income.Group == "Low income",]

#Filter countries by Lower middle income
stats[stats$Income.Group == "Lower middle income",]

#Filter countries by Upper middle income
stats[stats$Income.Group == "Upper middle income",]