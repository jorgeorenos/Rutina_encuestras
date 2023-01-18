# Limpiamos el área de trabajo
rm(list = ls())
source("C:/Users/Lorena/Desktop/Rutina_encuestras/funcion_disposicion.R")

estr <- scan("C:/Users/Lorena/Desktop/Rutina_encuestras/Códigos Dedoose/Dimensión Direccionamiento estratégico/PRUEBA 3/ED.txt",
             what = character(), sep = "\n", fileEncoding = "UTF-8", allowEscapes = T)

innov <- scan("C:/Users/Lorena/Desktop/Rutina_encuestras/Códigos Dedoose/Dimensión Direccionamiento estratégico/PRUEBA 3/BI.txt",
              what = character(), sep = "\n", fileEncoding = "UTF-8", allowEscapes = T)

clima <- scan("C:/Users/Lorena/Desktop/Rutina_encuestras/Códigos Dedoose/Dimensión Direccionamiento estratégico/PRUEBA 3/CO.txt",
              what = character(), sep = "\n", fileEncoding = "UTF-8", allowEscapes = T)

mecan <- scan("C:/Users/Lorena/Desktop/Rutina_encuestras/Códigos Dedoose/Dimensión Direccionamiento estratégico/PRUEBA 3/MC.txt",
              what = character(), sep = "\n", fileEncoding = "UTF-8", allowEscapes = T)

gestion <- scan("C:/Users/Lorena/Desktop/Rutina_encuestras/Códigos Dedoose/Dimensión Direccionamiento estratégico/PRUEBA 3/GPR.txt",
                what = character(), sep = "\n", fileEncoding = "UTF-8", allowEscapes = T)


# Análisis estrategia de direccionamiento
analisis_estr <- c()
for (i in seq_along(estr)) {
  valor <- disposicion(estr[i], diccionario = "afinn")
  analisis_estr[i] <- valor[[2]]
}

# Análisis innovación y disposición al cambio
analisis_innov <- c()
for (i in seq_along(innov)) {
  valor <- disposicion(innov[i], diccionario = "afinn")
  analisis_innov[i] <- valor[[2]]
}

# Análisis clima organizacional
analisis_clima <- c()
for (i in seq_along(clima)) {
  valor <- disposicion(clima[i], diccionario = "afinn")
  analisis_clima[i] <- valor[[2]]
}

# Análisis mecanismos de comunicación
analisis_mecan <- c()
for (i in seq_along(mecan)) {
  valor <- disposicion(mecan[i], diccionario = "afinn")
  analisis_mecan[i] <- valor[[2]]
}

# Análisis enfoque en gestión por procesos
analisis_gestion <- c()
for (i in seq_along(gestion)) {
  valor <- disposicion(gestion[i], diccionario = "afinn")
  analisis_gestion[i] <- valor[[2]]
}

rm(valor)

