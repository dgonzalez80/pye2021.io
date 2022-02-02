# install.packages("RSocrata", dependencies = TRUE)   # instalación de paquete RSocrata
library(RSocrata)    # llamado de libreria
library(tidyverse)   # libreria de librerias util en el manejo de datos
token <- "zxMsD6eXc0zlEMryRGW87Hwrz"  # token
Colombia <- read.socrata("https://www.datos.gov.co/resource/gt2j-8ykr.json", app_token = token) # lectura 
saveRDS(Colombia, file = "data/Colombia.RDS") 

Colombia<- readRDS("data/Colombia.RDS")
Colombia$edad=as.integer(Colombia$edad)
Colombia$sexo=str_to_lower(Colombia$sexo)
Colombia$estado=str_to_lower(Colombia$estado)
Colombia$estado[Colombia$estado=="n/a"]=NA
Colombia$recuperado=str_to_lower(Colombia$recuperado)
Colombia$recuperado[Colombia$recuperado=="n/a"]=NA



Colombia22=subset(Colombia, Colombia$fecha_reporte_web>="2022-01-01")

table(Colombia22$estado)
summarytools::freq(Colombia22$estado, cumul = F)

summarytools::descr(Colombia22$edad)


