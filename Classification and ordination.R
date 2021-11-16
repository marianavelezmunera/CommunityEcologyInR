#Classification and ordination
bats<-read.delim("Murcis.txt")
bats<-bats[,c(1,10,13:18)] #We select the variables of interest

#To perform the classification I used functions of the package vegan 
library(vegan)
#Classification 
#The first step is to convert the data in a distance matrix
row.names(bats)<-paste(bats$Especie,1:128,sep = "_") #This is to name every row by its species and a serial number (in this case rows are individuals)
bats<-bats[,3:8]
bats<-na.omit(bats)#This omits the missing values
matrixdist<-vegdist(bats,method="euclidean",na.rm = TRUE) #The distance in this case is euclidean distance, because the data consist only in measures, if we had presence/absence data or richness we could use other distances (Jaccard or Bray-Curtis)
matrixdist
as.matrix(matrixdist) #The function vegdist makes a R object called "dist" but we apply this function to convert the object in a matrix 

#The classification used here is UPGMA (Unweighted pair-group method using arithmetic averages) which is a simple agglomerative (bottom-up) hierarchical clustering method. 

batupgma<-hclust(matrixdist,method = "average")
plot(batupgma)

#As we can see, individuals of the same species/family are closer, this makes sense as this tree classifies the individual based on their measurements and it's logical that individuals of the same species have more similar measurements 

#Ordination

#To perform the classification I used functions of the package ade4. The analysis is a Principal Components Analysis (PCA)
library(ade4)

pca<-dudi.pca(bats,center = TRUE,scale = TRUE,scannf = FALSE)
summary(pca) #This shows the main PCA information, such as the eigenvalues and the inertia in every axis
s.corcircle(pca$co) #Correlation circle, shows the relationships between variables
pca$co #Shows every component and its relationship to each variable, negative numbers imply negative correlations, the bigger the number, the strongest the correlation to that component, and means that that variable is an important source of variability in that system
biplot(pca)
