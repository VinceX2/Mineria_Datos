getwd()
setwd("/home/eduardo/Escritorio/Tareas Mineria/Examen")
#setwd("/Users/VinceLAB/Documents/ITT /Ene - Jun 2020/Mineria/RepoGitHub/MineriaRepo/Unidad2/Evaluacion")
getwd()

# We load the svc
movies <- read.csv("Project-Data.csv")
# We indicate which columns are the ones we use from our dataset
movies <- movies [c(3,6,8,18)]
# Since the review manager is only interested in certain genres of movies we filter our dataset
movies<-movies[movies$Genre=="action"|movies$Genre=="adventure"|movies$Genre=="animation"|movies$Genre=="comedy"|movies$Genre=="drama",]

# It tells us that the studios you are interested in are the following, Buena Vista Studios, Fox, Paramount Picture, Sony, Universal and WB
movies<-movies[movies$Studio=="Buena Vista Studios" | movies$Studio=="Fox" | movies$Studio=="Paramount Pictures" 
               |movies$Studio=="Sony" |movies$Studio=="Universal" |movies$Studio=="WB",]

# we look at the first data of our dataset
head(movies)
# Rename the columns
colnames(movies) <- c("Genre", "Studio", "BudgetMillions", "GrossUS")
# We look at the first 6 records
head(movies)
# We look at the last 6 records
tail(movies)
# We look at the structure of our data
str(movies)
# We look at a general summary of the data
summary(movies)


# we import the ggplot2 library to graph and use aesthetics
library(ggplot2)

#boxplots

# We start to build our graph


# To our varaiable we load our dataset movies
# for aesthetics we say that on the x axis it will be determined by Genre
# the axis and is determined by GrossUS
# Each color in the chart will be determined by Studio and Size by BudgetMIlllions
u <- ggplot(movies, aes(x=Genre, y=GrossUS,
                        color=Studio, size=BudgetMillions))


# Plot indicating the type of graph in this case with box diagrams
u + geom_boxplot()  

# We indicate the thickness of the outline and the color of the boxes by adding the density of points on it
u +  geom_jitter() + geom_boxplot(size=0.3,color="Black") 


# We indicate the opacity of the boxes to be able to notice the dispersion removing the unusual points
# finally we add a title and name our axes "x" and "y"
u + geom_jitter(shape=20) + geom_boxplot(size=0.3,alpha=0.5,color="Black",outlier.shape = NA)+ theme(
  plot.title = element_text(color="Black", size=14, face="bold", hjust = 0.5),
  axis.title.x = element_text(color="blue", size=14, face="bold"),
  axis.title.y = element_text(color="purple", size=14, face="bold")
)  +  ggtitle("Domestic Gross % by Genre") + ylab("Gross %US") 
