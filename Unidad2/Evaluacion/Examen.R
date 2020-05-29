getwd()
setwd("/home/eduardo/Escritorio/Tareas Mineria/Examen")
getwd()


movies <- read.csv("Project-Data.csv")
#Indicamos que columnas son las que utilizaremos de nuestro dataset
movies <- movies [c(3,6,8,18)]
# Dado que el directivo de resenas le interesa solo ciertos generos de peliculas filtramos nuestro dataset
movies<-movies[movies$Genre=="action"|movies$Genre=="adventure"|movies$Genre=="animation"|movies$Genre=="comedy"|movies$Genre=="drama",]

# Nos dice que los estidios que le interesa son los siguiente Buena Vista Studios, Fox, Paramount Picture, Sony, Universal y WB
# Filtramos nuestro dataset
movies<-movies[movies$Studio=="Buena Vista Studios" | movies$Studio=="Fox" | movies$Studio=="Paramount Pictures" 
               |movies$Studio=="Sony" |movies$Studio=="Universal" |movies$Studio=="WB",]

# miramos los primeros datos de nuestro dataset
head(movies)
# Renombramos las columnas
colnames(movies) <- c("Genre", "Studio", "BudgetMillions", "GrossUS")
#Miramos los primeros 6 registros 
head(movies)
# Miramos los ultimos 6 registros
tail(movies)
# Miramos la estructura de nuestros datos
str(movies)
# Miramos un resumen genreal de los datos
summary(movies)

# importamos la libreria ggplot2 para graficar y utlizar estetica
library(ggplot2)

#boxplots

# Comenzamos a contruir nuestra grafica

# A nuestra varaiable u le cargamos nuetro dataset movies
# para la estetica decimos que en el eje x sera determinado por Genre
# el eje y lo determina GrossUS
# Cada color en la grafica lo sera determinado por Studio y Size por BudgetMIlllions
u <- ggplot(movies, aes(x=Genre, y=GrossUS,
                        color=Studio, size=BudgetMillions))

# Ploteamos indicando el tipo de grafica en este caso con diagramas de cajas
u + geom_boxplot()  

# Indicamos el grosor del contorno y el color de las cajas agregando la dencidad de puntos en ella
u +  geom_jitter() + geom_boxplot(size=0.3,color="Black") 

# Indicamos la opacidad de las cajas para poder notar la dispercion quitando los puntos atipicos
# finalmente le agregamos un titulo y nombramos nuestros ejes "x" y "y"

u + geom_jitter(shape=20) + geom_boxplot(size=0.3,alpha=0.5,color="Black",outlier.shape = NA)+ theme(
  plot.title = element_text(color="Black", size=14, face="bold", hjust = 0.5),
  axis.title.x = element_text(color="blue", size=14, face="bold"),
  axis.title.y = element_text(color="purple", size=14, face="bold")
)  +  ggtitle("Domestic Gross % by Genre") 
