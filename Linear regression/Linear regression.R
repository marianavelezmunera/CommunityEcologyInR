#Packages needed for the analysis of raster files

library(terra)
library(sp)
setwd("~/Cosas de la universidad/DECIMO SEMESTRE/ECOLOGIA DE COMUNIDADES/Talleres/Taller #10 ÚLTIMO")

#GIS data
sitios <- na.omit(read.table("Sitios_Spp.txt", header=TRUE, sep='\t')) #locations
alt<-rast("alt.asc") #Elevation data
precipitacion<-rast("bio12.asc") #Precipitation
temperatura<-rast("bio1.asc") #Temperature
est.temp<-rast("bio4.asc")  #Temperature seasonality
est.pre<-rast("bio15.asc") #Precipitation seasonality
sitios.sp <- vect(sitios, crs="+proj=longlat +datum=WGS84", geom=c("LongDecDeg", "LatDecDeg")) 

sitios.sp$AllSpp #Species richness per location

#Plots

plot(alt,main="Elevación")
zoom(alt,e=ext(sitios.sp))
plot(sitios.sp, pch=20, col=gray(0.2,alpha=0.6), add=TRUE)

plot(precipitacion,main="Precipitacion")
zoom(precipitacion,e=ext(sitios.sp))
plot(sitios.sp, pch=20, col=gray(0.2,alpha=0.6), add=TRUE)

plot(temperatura,main="Temperatura")
zoom(temperatura,e=ext(sitios.sp))
plot(sitios.sp, pch=20, col=gray(0.2,alpha=0.6), add=TRUE)

plot(est.temp,main="Estacionalidad en la temperatura")
zoom(est.temp,e=ext(sitios.sp))
plot(sitios.sp, pch=20, col=gray(0.2,alpha=0.6), add=TRUE)

plot(est.pre,main="Estacionalidad en la precipitación")
zoom(est.pre,e=ext(sitios.sp))
plot(sitios.sp, pch=20, col=gray(0.2,alpha=0.6), add=TRUE)

#Information for the regression model

alt.sitios<-extract(alt,sitios.sp)
alt.sitios<-scale(alt.sitios)
pre.sitios<-extract(precipitacion,sitios.sp)
pre.sitios<-scale(pre.sitios)
temp.sitios<-extract(temperatura,sitios.sp)
temp.sitios<-scale(temp.sitios)
est.temp.sitios<-extract(est.temp,sitios.sp)
est.temp.sitios<-scale(est.temp.sitios)
est.pre.sitios<-extract(est.pre,sitios.sp)
est.pre.sitios<-scale(est.pre.sitios)

datos<-cbind(alt.sitios,pre.sitios[,2],temp.sitios[,2],est.temp.sitios[,2],est.pre.sitios[,2],sitios$AllSpp)
colnames(datos)<-c("ID","altitud","precipitacion","temperatura","est.temperatura","est.precipitacion","riqueza")
head(datos)
class(datos)
datos<-as.data.frame(datos)
#Modelos

modelo1<-lm(riqueza~altitud,data=datos)
summary(modelo1)
plot(riqueza~altitud*temperatura,data=datos)
modelo2<-lm(riqueza~precipitacion*temperatura,data=datos)
summary(modelo2)
modelo3<-lm(riqueza~precipitacion,data=datos)
summary(modelo3)
modelo4<-lm(riqueza~altitud+precipitacion+temperatura,data=datos)
summary(modelo4)
modelo5<-lm(riqueza~precipitacion*est.precipitacion,data=datos)
summary(modelo5)
AIC1 <- AIC(modelo1)
AIC2 <- AIC(modelo2)
AIC3 <- AIC(modelo2)
AIC4<- AIC(modelo4)
AIC5<-AIC(modelo5)

modelos<-c("Riqueza~Altitud","Riqueza~Altitud*Temperatura","Riqueza~Precipitacion","Riqueza~Altitud+Precipitacion+Temperatura","Riqueza~Precipitacion*Est.precipitacion")
resultados<-c(0.00913,0.1391,0.09821,0.1387,0.1458)
AICs<-c(AIC1,AIC2,AIC3,AIC4,AIC5)
tabla<-data.frame(modelos,resultados,AICs)
colnames(tabla)<-c("Modelo","R ajustado","AIC")
tabla

m<-lm(riqueza~altitud+precipitacion+est.temperatura,data=datos)
summary(m)
AIC(m)
AIC1
AIC2
AIC3
AIC4
