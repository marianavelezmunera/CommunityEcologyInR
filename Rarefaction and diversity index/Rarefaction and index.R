#This code is for rarefaction curves and diversity index. The data used is abundance data of young and old individuals of pines species

library(readxl)
niemela <- read_excel("Niemela.xlsx")

#Rarefaction for young individuals
library(vegan)
pinojovenrare<-rarefy(niemela[,2],sample = c(1:243),se=TRUE)
plot(pinojovenrare[1,],type = "l",xlab="Numero de individuos",ylab="Numero de especies",main="Curva de rarefacción") #sample is from 0 to N

#Error bars 
arrows(x0=c(1:243),y0=pinojovenrare[1,],x1=c(1:243),y1=pinojovenrare[1,]+pinojovenrare[2,],length = 0,col = "hotpink") 
arrows(x0=c(1:243),y0=pinojovenrare[1,],x1=c(1:243),y1=pinojovenrare[1,]-pinojovenrare[2,],length = 0,col = "hotpink")

#Rarefaction curve for old pines
pinoviejorare<-rarefy(niemela[,3],sample = c(1:63),se=TRUE)
points(x=c(1:63),y=pinoviejorare[1,],type = "l")
arrows(x0=c(1:63),y0=pinoviejorare[1,],x1=c(1:63),y1=pinoviejorare[1,]+pinoviejorare[2,],length = 0,col = "lightblue")

#Error bars 
arrows(x0=c(1:63),y0=pinoviejorare[1,],x1=c(1:63),y1=pinoviejorare[1,]-pinoviejorare[2,],length = 0,col = "lightblue")
legend("bottomright",c("Pinos jovenes","Pinos viejos"),lty =c(1,1),col = c("hotpink","lightblue"))