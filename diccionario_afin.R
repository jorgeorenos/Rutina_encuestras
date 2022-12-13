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

