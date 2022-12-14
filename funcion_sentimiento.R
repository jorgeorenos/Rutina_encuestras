# Construcción de la función para el análisis de sentimientos
# Cargamos la libreria stringr para manipular texto
library(stringr)

sentimientos <- function(texto){
  
  texto <- tolower(texto)
  palabras <- str_split(texto, " ")
  
  diccionario <- read.csv("https://raw.githubusercontent.com/jorgeorenos/Rutina_encuestras/modificaciones/Diccionarios/diccionario_afinn_modificado.csv",
                          fileEncoding = "latin1")
  
  Ponderacion <- diccionario[which(diccionario$Palabra %in% palabras), "Palabra", "Puntuacion", "positivas", "negativas"]
  valor <- sum(Ponderacion$Puntuacion)
  
  return(list(Ponderacion, valor))
  print("La valoración del sentimiento es")
  print(valor)
}
