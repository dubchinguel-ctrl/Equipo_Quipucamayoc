## Extraer datos de Pisco, para precipitación, temperatura y evapotranspiración 
setwd("E:/EVALHID_PICOTANI")
#install.packages("ncdf4") #instalar de no tenerlos
#install.packages("raster") #instalar de no tenerlos
#install.packages(c("sf", "terra")) #instalar de no tenerlos
library(ncdf4)
library(raster)
## Obtener los datos de precipitación media por cada subcuenca
Pisco.prec<- brick("PISCOPrec.nc")
library(sf)
## Precipitación Picotani
cuenca<-st_read(dsn=".", layer = "cc_picotani_WGS84")
plot(cuenca)
prec.cuenca.men<-extract(Pisco.prec, cuenca, fun=mean)
range(prec.cuenca.men)
plot(prec.cuenca.men[1,], type = "l", col="blue", ylim=c(0,300), ylab ="precipitación mm", xlab = "meses")
write.csv(t(prec.cuenca.men), 'Precipitacion_Media_picotani.CSV')

## Precipitación Cuenca 682 parte alta
cuenca<-st_read(dsn=".", layer = "Cuenca_682_parte_alta")
plot(cuenca)
prec.cuenca.men<-extract(Pisco.prec, cuenca, fun=mean)
range(prec.cuenca.men)
plot(prec.cuenca.men[1,], type = "l", col="blue", ylim=c(0,300), ylab ="precipitación mm", xlab = "meses")
write.csv(t(prec.cuenca.men), 'Precipitacion_Media_682_parte_alta.CSV')

## Precipitación Cuenca 682 parte baja
cuenca<-st_read(dsn=".", layer = "Cuenca_682_parte_baja")
plot(cuenca)
prec.cuenca.men<-extract(Pisco.prec, cuenca, fun=mean)
range(prec.cuenca.men)
plot(prec.cuenca.men[1,], type = "l", col="blue", ylim=c(0,300), ylab ="precipitación mm", xlab = "meses")
write.csv(t(prec.cuenca.men), 'Precipitacion_Media_682_parte_baja.CSV')

## Evapotranspiración potencial

Pisco.evapo<- brick("PISCOPrec.nc")
## Precipitación Picotani
cuenca<-st_read(dsn=".", layer = "cc_picotani_WGS84")
plot(cuenca)
evapo.cuenca.men<-extract(Pisco.evapo, cuenca, fun=mean)
range(evapo.cuenca.men)
plot(evapo.cuenca.men[1,], type = "l", col="blue", ylim=c(0,300), ylab ="evapotranspiración mm", xlab = "meses")
write.csv(t(evapo.cuenca.men), 'Evapotranspiración_Media_picotani.CSV')

## Evapotranspiración potencial Cuenca 682 parte alta
cuenca<-st_read(dsn=".", layer = "Cuenca_682_parte_alta")
plot(cuenca)
evapo.cuenca.men<-extract(Pisco.evapo, cuenca, fun=mean)
range(evapo.cuenca.men)
plot(evapo.cuenca.men[1,], type = "l", col="blue", ylim=c(0,300), ylab ="evapotranspiración mm", xlab = "meses")
write.csv(t(evapo.cuenca.men), 'Evapotranspiración_Media_682_parte_alta.CSV')

## Evapotranspiración potencial Cuenca 682 parte baja
cuenca<-st_read(dsn=".", layer = "Cuenca_682_parte_baja")
plot(cuenca)
evapo.cuenca.men<-extract(Pisco.evapo, cuenca, fun=mean)
range(evapo.cuenca.men)
plot(evapo.cuenca.men[1,], type = "l", col="blue", ylim=c(0,300), ylab ="precipitación mm", xlab = "meses")
write.csv(t(evapo.cuenca.men), 'Evapotranspiración_Media_682_parte_baja.CSV')

## Temperatura media 
Pisco.temmax<- brick("PISCO_Tem_Max.nc")
Pisco.temmin<- brick("PISCO_Tem_Min.nc")
## Precipitación Picotani
cuenca<-st_read(dsn=".", layer = "cc_picotani_WGS84")
plot(cuenca)
temmax.cuenca.men<-extract(Pisco.temmax, cuenca, fun=mean)
temmin.cuenca.men<-extract(Pisco.temmin, cuenca, fun=mean)
temprom.cuenca.mean<- (temmax.cuenca.men + temmin.cuenca.men) / 2
range(temprom.cuenca.mean)
plot(temprom.cuenca.mean[1,], type = "l", col="blue", ylim=c(0,15), ylab ="Temperatura °C", xlab = "meses")
write.csv(t(temprom.cuenca.mean), 'Temperatura_Media_picotani.CSV')

## Evapotranspiración potencial Cuenca 682 parte alta
cuenca<-st_read(dsn=".", layer = "Cuenca_682_parte_alta")
plot(cuenca)
temmax.cuenca.men<-extract(Pisco.temmax, cuenca, fun=mean)
temmin.cuenca.men<-extract(Pisco.temmin, cuenca, fun=mean)
temprom.cuenca.mean<- (temmax.cuenca.men + temmin.cuenca.men) / 2
range(temprom.cuenca.mean)
plot(temprom.cuenca.mean[1,], type = "l", col="blue", ylim=c(0,15), ylab ="Temperatura °C", xlab = "meses")
write.csv(t(temprom.cuenca.mean), 'Temperatura_Media_682_parte_alta.CSV')

## Evapotranspiración potencial Cuenca 682 parte baja
cuenca<-st_read(dsn=".", layer = "Cuenca_682_parte_baja")
plot(cuenca)
temmax.cuenca.men<-extract(Pisco.temmax, cuenca, fun=mean)
temmin.cuenca.men<-extract(Pisco.temmin, cuenca, fun=mean)
temprom.cuenca.mean<- (temmax.cuenca.men + temmin.cuenca.men) / 2
range(temprom.cuenca.mean)
plot(temprom.cuenca.mean[1,], type = "l", col="blue", ylim=c(0,15), ylab ="Temperatura °C", xlab = "meses")
write.csv(t(temprom.cuenca.mean), 'Temperatura_Media_682_parte_baja.CSV')
