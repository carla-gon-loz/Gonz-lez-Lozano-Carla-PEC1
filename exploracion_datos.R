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


# Calcular resumen estadístico para cada variable de medición
measurement_data <- assays(se)$counts
summary_stats <- data.frame(
  Mean = colMeans(measurement_data, na.rm = TRUE),
  Median = apply(measurement_data, 2, median, na.rm = TRUE),
  SD = apply(measurement_data, 2, sd, na.rm = TRUE),
  Min = apply(measurement_data, 2, min, na.rm = TRUE),
  Max = apply(measurement_data, 2, max, na.rm = TRUE)
)

print(summary_stats)

# Transponer measurement_data para que cada variable de medición sea una columna
measurement_data_t <- t(measurement_data)

# Crear un boxplot para cada variable de medición
boxplot(measurement_data_t, 
        main = "Distribución de Variables de Medición a través de Pacientes",
        xlab = "Variables de Medición", 
        ylab = "Valores de Medición", 
        col = "lightgreen", 
        outline = FALSE, 
        las = 2)

# Calcular la media de cada variable que se ha medidio en los pacientes
variable_means <- rowMeans(measurement_data, na.rm = TRUE)
named_variable_means <- data.frame(Variable = rownames(measurement_data), Mean = variable_means)
print(named_variable_means)

#Distribución de los datos
summary(data_matrix_t) #Usamos la matriz datos

variable_means <- colMeans(data_matrix_t, na.rm=TRUE)
top_variables <- head(sort(variable_means, decreasing=TRUE), 10)   # Variables con mayor media
bottom_variables <- head(sort(variable_means), 10)                 # Variables con menor media
top_variables
bottom_variables

# Calcular la varianza para cada variable y visualizar las 10 más altas
variance <- apply(measurement_data, 2, var, na.rm = TRUE)
variance_summary <- data.frame(Variable = colnames(measurement_data), Variance = variance)
variance_summary <- variance_summary[order(-variance_summary$Variance), ]
print(head(variance_summary, 10))  # Las 10 variables con mayor varianza




