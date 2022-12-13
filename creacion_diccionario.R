# Descargamos la libreria tidyverse para trabajar los datos
library(tidyverse)
library(fastmatch)
# Descargando el diccionario "afin"
## Diccionario traducido del repositorio https://github.com/jboscomendoza/rpubs.git

download.file("https://raw.githubusercontent.com/jboscomendoza/rpubs/master/sentimientos_afinn/lexico_afinn.en.es.csv",
              destfile = "diccionario_afin.csv")

## Cargando el diccionario para extrer positivas y negativas
diccionario <- read.csv("diccionario_afin.csv", fileEncoding = "latin1")

positivas <- diccionario %>% filter(Puntuacion >= 0) %>% select(Palabra, Puntuacion)
negativas <- diccionario %>% filter(Puntuacion < 0) %>% select(Palabra, Puntuacion)

# Creando un solo diccionario
## Obtenemos la posición de las palabras positivas y negativas
pos_negativas <- fmatch(negativas$Palabra, diccionario$Palabra)
pos_positivas <- fmatch(positivas$Palabra, diccionario$Palabra)

## Imputamos valores negativos negativas
diccionario[,"negativas"] <- 0 
diccionario[pos_negativas,"negativas"] <- abs(diccionario$Puntuacion[pos_negativas])

## Imputando valores de palabras positivas
diccionario[,"positivas"] <- 0
diccionario[pos_positivas, "positivas"] <- diccionario$Puntuacion[pos_positivas]
