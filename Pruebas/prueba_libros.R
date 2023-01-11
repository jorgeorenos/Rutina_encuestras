# Ejemplos diccionario nrc y afinn
## Ejemplo diccionario nrc
### Cargamos la función para el análisis de disposición
library(tidyverse)
library(syuzhet)
source("funcion_disposicion.R")

# El libro a analizar es la dama de las camelias
dama <- scan(file = "Pruebas/Dama.txt", what = character(), fileEncoding = "UTF-8", sep = "\n", allowEscapes = T)

# Corremos el análisis tomado de referencia el libro "La dama de las camealias"
analisis_dama <- disposicion(dama, diccionario = "nrc")

# Graficamos los resultados con media movil y regresión local
## Primero definimos la ventana de la media movil como el 10% del total de ponderaciones
ventana_dama <- round(length(analisis_dama)*0.10) 

## Definimos la media movil y la escalamos con la función rescale de syuzhet
## Esto normaliza los valores entre -1 y 1
media_movil_dama <- rescale(zoo::rollmean(analisis_dama, ventana_dama))

ggplot() +
  geom_line(aes(x = 1:length(media_movil_dama), 
                y = media_movil_dama)) +
  geom_smooth(aes(x = 1:length(media_movil_dama), 
                  y = media_movil_dama), se = FALSE) +
  geom_hline(yintercept = 0) +
  labs(title = "Análisis de disposición",
       subtitle = "La dama de las camelias",
       x = "",
       y = "") +
  theme_minimal() +
  theme(plot.title = element_text(size = 17, face = "bold"),
        plot.subtitle = element_text(size = 15),
        axis.text = element_text(size = 11))

simple_plot(analisis_dama)

# Libro a analizar MIAU por  B. PÉREZ GALDÓS

miau <- scan(file = "https://raw.githubusercontent.com/programminghistorian/jekyll/gh-pages/assets/galdos_miau.txt", 
             fileEncoding = "UTF-8", what = character(), sep = "\n", allowEscapes = T)

# corremos el análisis tomando de referencia el libro "MIAU"
analisis_miau <- disposicion(miau, "nrc")

# Graficamos los resultados con media movil y regresión local
## Primero definimos la ventana de la media movil como el 10% del total de ponderaciones
ventana_miau <- round(length(analisis_miau)*.10)

## Definimos la media movil y la escalamos con la función rescale de syuzhet
## Esto normaliza los valores entre -1 y 1
media_movil_miau <- rescale(zoo::rollmean(analisis_miau, ventana_miau))

ggplot() +
  geom_line(aes(x = 1:length(media_movil_miau), 
                y = media_movil_miau)) +
  geom_smooth(aes(x = 1:length(media_movil_miau), 
                  y = media_movil_miau), se = FALSE) +
  geom_hline(yintercept = 0) +
  labs(title = "Análisis de disposición",
       subtitle = "La dama de las camelias",
       x = "",
       y = "") +
  theme_minimal() +
  theme(plot.title = element_text(size = 17, face = "bold"),
        plot.subtitle = element_text(size = 15),
        axis.text = element_text(size = 11))

simple_plot(analisis_miau)
