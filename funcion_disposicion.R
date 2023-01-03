### Construcción de la función para el análisis de sentimientos ###
# La función admite dos diccionarios, el nrc y afinn que contiene la libreria suzhet

disposicion <- function(texto, diccionario = "nrc"){
  library(syuzhet)
  
  if (diccionario == "nrc") {
  # Proceso de normalización del texto
  texto <- get_sentences(texto)
  
  # usamos el diccionario nrc para hacer el análisis de disposición
  disp <- get_sentiment(texto, 
                               method = diccionario, 
                               language = "spanish")
  
  } 
  
  else if(diccionario == "afinn"){
    # Proceso de normalización del texto
    texto <- get_sentences(texto)
    
    # usamos el diccionario nrc para hacer el análisis de disposición
    disp <- get_sentiment(texto, 
                          method = diccionario, 
                          language = "spanish")
  }
  
  return(disp)
}