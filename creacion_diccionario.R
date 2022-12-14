# Descargamos la libreria tidyverse para trabajar los datos
library(tidyverse)

# Descargando el diccionario "afinn"
## Diccionario traducido del repositorio https://github.com/jboscomendoza/rpubs.git

download.file("https://raw.githubusercontent.com/jboscomendoza/rpubs/master/sentimientos_afinn/lexico_afinn.en.es.csv",
              destfile = "Diccionarios/diccionario_afinn.csv")

# Cargando el diccionario para extrer positivas y negativas
afinn <- read.csv("Diccionarios/diccionario_afinn.csv", fileEncoding = "latin1")

# Mutate para generar nuevas columas
## Columnas con el valor absoluto de cada palabra.
afinn <- afinn %>% mutate("positivas" = ifelse(Puntuacion >= 0, Puntuacion, 0),
                                      "negativas" = ifelse(Puntuacion < 0, abs(Puntuacion), 0))

# Identificación de palabras positivas y negativas
positivas <- afinn %>% filter(Puntuacion >= 0) %>% select(Palabra, Puntuacion)
negativas <- afinn %>% filter(Puntuacion < 0) %>% select(Palabra, Puntuacion)

# comprobamos que la imputación fue correcta
sum(afinn$negativas) + sum(negativas$Puntuacion)
sum(afinn$positivas) - sum(positivas$Puntuacion)

write.csv(afinn, file = "Diccionarios/diccionario_afinn_modificado.csv",
          fileEncoding = "latin1")


# CREACION DICCIONARIO "NRC"

# Cargando el diccionario
nrc <- read.table("Diccionarios/Spanish-NRC-Emolex.txt", header = TRUE, sep = "\t")

write.csv(nrc, file = "Diccionarios/diccionario_nrc.csv",
          fileEncoding = "latin1")
