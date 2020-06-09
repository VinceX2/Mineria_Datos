# K-Means Clustering
# Set our workspace
getwd()
setwd("/Users/VinceLAB/Documents/ITT /Ene - Jun 2020/Mineria/RepoGitHub/MineriaRepo/Unidad3/Evaluacion")
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

table(kmeans$cluster,dataset.class)
# Visualising the clusters
# install.packages('cluster')
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 1,
         shade = FALSE,
         color = TRUE,
         labels = 4,
         plotchar = TRUE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Specie',
         )

    