# install.packages("RSocrata", dependencies = TRUE)   # instalación de paquete RSocrata
library(RSocrata)    # llamado de libreria
library(tidyverse)   # libreria de librerias util en el manejo de datos
token <- "zxMsD6eXc0zlEMryRGW87Hwrz"  # token


Colombia$edad=as.integer(Colombia$edad)
Colombia$sexo=str_to_lower(Colombia$sexo)
Colombia$estado=str_to_lower(Colombia$estado)
Colombia$estado[Colombia$estado=="n/a"]=NA
Colombia$recuperado=str_to_lower(Colombia$recuperado)
Colombia$recuperado[Colombia$recuperado=="n/a"]=NA

# seleccion de bases
Colombia22=subset(Colombia, Colombia$fecha_reporte_web>="2022-01-01")
Colombia21=subset(Colombia, Colombia$fecha_reporte_web>="2021-01-01" & Colombia$fecha_reporte_web<"2022-01-01")
Colombia20=subset(Colombia, Colombia$fecha_reporte_web>="2020-01-01" & Colombia$fecha_reporte_web<"2021-01-01")

Valle22=subset(Colombia22, departamento=="76")
Cali22= subset(Colombia22, ciudad_municipio_nom=="CALI")

table(Colombia22$estado)
table(Colombia21$estado)
table(Colombia20$estado)




summarytools::freq(Colombia22$estado, cumul = F)
summarytools::freq(Colombia21$estado, cumul = F)
summarytools::freq(Colombia20$estado, cumul = F)


summarytools::descr(Colombia22$edad)

saveRDS(Colombia, file = "data/Colombia.RDS") 




#-----------------------------------------------------














