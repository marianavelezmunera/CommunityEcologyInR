datosBCI<-read.table(file.choose(),header=TRUE,sep = "\t")
coordenadas<-read.table(file.choose(),header=TRUE)
plot(coordenadas,ylab="Latitud",xlab="Longitud",main="Mapa de coordenadas")
#Adelia triloba
plot(coordenadas,cex=as.numeric(datosBCI["Adelia.triloba",]),pch=20,col="red",main="Distribuci?n de Adelia triloba",xlab="Longitud",ylab="Latitud")
#Cecropia insignis
plot(coordenadas,cex=as.numeric(datosBCI["Cecropia.insignis",]),pch=20,col="pink",main="Distribuci?n de Cecropia insignis",xlab="Longitud",ylab="Latitud")
#Abarema macradenia
plot(coordenadas,cex=as.numeric(datosBCI["Abarema.macradenia",]),pch=20,col="hotpink",main="Distribuci?n de Abarema macradenia",xlab="Longitud",ylab="Latitud")
#Heisteria acuminata
plot(coordenadas,cex=as.numeric(datosBCI["Heisteria.acuminata",]),pch=20,col="brown",main="Distribuci?n de Heisteria acuminata",xlab="Longitud",ylab="Latitud")
#Nectandra.cissiflora
plot(coordenadas,cex=as.numeric(datosBCI["Nectandra.cissiflora",]),pch=20,col="orange",main="Distribuci?n de Nectandra.cissiflora",xlab="Longitud",ylab="Latitud")