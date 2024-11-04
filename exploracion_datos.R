#Exploración de los datos en R

#Cargar las librerias necesarias 
library(SummarizedExperiment)

#Cargar el objeto .Rda que contiene los datos y metadatos
load("datos_metadatos.Rda")

#Información general del onjeto SummarizedExperiment (se)
se

#Información sobre las dimensiones del objeto
dim(se)
nrow(se)
ncol(se)

#Distribución de los datos
summary(data_matrix_t) #Usamos la matriz datos

variable_means <- colMeans(data_matrix_t, na.rm=TRUE)
top_variables <- head(sort(variable_means, decreasing=TRUE), 10)   # Variables con mayor media
bottom_variables <- head(sort(variable_means), 10)                 # Variables con menor media
top_variables
bottom_variables
