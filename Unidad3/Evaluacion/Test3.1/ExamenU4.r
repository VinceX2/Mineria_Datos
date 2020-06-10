# K-Means Clustering
# Set our workspace
getwd()
setwd("/Users/VinceLAB/Documents/ITT /Ene - Jun 2020/Mineria/RepoGitHub/MineriaRepo/Unidad3/Evaluacion")
#setwd("/home/eduardo/Escritorio/semestre_9/Mineria_Datos/Unidad3/Evaluacion")
getwd()

# Importing the dataset
dataset = read.csv('iris.csv')
head(dataset)
dataset.class<- dataset[,"species"]
dataset = dataset[1:4]
head(dataset)

# Using the elbow method to find the optimal number of clusters
set.seed(6)
# Within-Cluster-Sum-of-Squares
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')


# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster
y_kmeans

# Table of clusters that the algorithm K-means found
table(dataset.class,kmeans$cluster,dnn=c("Species","Cluster number"))

# Visualising the clusters
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = FALSE,
         color = TRUE,
         labels = 4,
         plotchar = TRUE,
         span = TRUE,
         main = paste('Clusters of iris'),
         )

# relationship between features
# red: setosa
# green: versicolor
# blue: virginia
upper.panel<-function(x, y){
        points(x,y, pch=19, col=c("red", "green3", "blue")[dataset.class])
        r <- round(cor(x, y), digits=2)
        txt <- paste0("R = ", r)
        usr <- par("usr"); on.exit(par(usr))
        par(usr = c(0, 1, 0, 1))
        text(0.5, 0.9, txt)
}
pairs(dataset, lower.panel = NULL, 
      upper.panel = upper.panel)
