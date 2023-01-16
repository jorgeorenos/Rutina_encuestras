# Construcción de la función para el análisis de sentimientos

disposicion <- function(texto, diccionario = "nrc"){
  library(tidyverse)
  library()
  texto <- tolower(texto)
  palabras <- unlist(strsplit(texto, "\\W"))
  palabras <- palabras[which(palabras != "")]
  
  if (diccionario == "nrc") {
  nrc <- read.csv("https://raw.githubusercontent.com/jorgeorenos/Rutina_encuestras/modificaciones/Diccionarios/diccionario_nrc.csv",
                  fileEncoding = "latin1")
  
  Ponderacion <- nrc[which(nrc$Spanish.Word %in% palabras), c("Spanish.Word", "intensidad","positivas", 
                                                              "negativas", "Emotion.Intensity.Score")]
  names(Ponderacion)[1] <- "Palabra"
  
  valor <- sum(Ponderacion$positivas) + sum(Ponderacion$negativas)  
  } 
  
  else if(diccionario == "afinn"){
    
    afinn <- read.csv("https://raw.githubusercontent.com/jorgeorenos/Rutina_encuestras/modificaciones/Diccionarios/diccionario_afinn_modificado.csv",
                      fileEncoding = "latin1")
    
    Ponderacion <- afinn[which(afinn$Palabra %in% palabras), c("Palabra", "Puntuacion", "positivas", "negativas")]
    valor <- sum(Ponderacion$Puntuacion)
    
  }
  
  return(list(Ponderacion, valor))
}