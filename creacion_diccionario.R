# Descargamos la libreria tidyverse para trabajar los datos
library(tidyverse)
library(fastmatch)
# Descargando el diccionario "afin"
## Diccionario traducido del repositorio https://github.com/jboscomendoza/rpubs.git

download.file("https://raw.githubusercontent.com/jboscomendoza/rpubs/master/sentimientos_afinn/lexico_afinn.en.es.csv",
              destfile = "diccionario_afin.csv")

# Cargando el diccionario para extrer positivas y negativas
diccionario <- read.csv("diccionario_afin.csv", fileEncoding = "latin1")

# Mutate para generar nuevas columas
## Columnas con el valor absoluto de cada palabra.
diccionario <- diccionario %>% mutate("positivas" = ifelse(Puntuacion >= 0, Puntuacion, 0),
                                      "negativas" = ifelse(Puntuacion < 0, abs(Puntuacion), 0))

# Identificación de palabras positivas y negativas
positivas <- diccionario %>% filter(Puntuacion >= 0) %>% select(Palabra, Puntuacion)
negativas <- diccionario %>% filter(Puntuacion < 0) %>% select(Palabra, Puntuacion)

# comprobamos que la imputación fue correcta
sum(diccionario$negativas) + sum(negativas$Puntuacion)
sum(diccionario$positivas) - sum(positivas$Puntuacion)

write.csv(diccionario, file = "Diccionarios/diccionario_afin_modificado.csv",
          fileEncoding = "latin1")
