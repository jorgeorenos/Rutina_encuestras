# Construcción de la función para el análisis de sentimientos

sentimientos <- function(texto){
  
  texto <- tolower(texto)
  palabras <- unlist(strsplit(texto, "\\W"))
  palabras <- palabras[which(palabras != "")]
  
  diccionario <- read.csv("https://raw.githubusercontent.com/jorgeorenos/Rutina_encuestras/modificaciones/Diccionarios/diccionario_afinn_modificado.csv",
                          fileEncoding = "latin1")
  
  Ponderacion <- diccionario[which(diccionario$Palabra %in% palabras), c("Palabra","Puntuacion", "positivas", "negativas")]
  valor <- sum(Ponderacion$Puntuacion)
  
  return(list(Ponderacion, valor))
}