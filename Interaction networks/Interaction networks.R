#Interaction plot with igraph

#This code creates an interaction plot, I made this graph using a data frame I made based on the video The Queen Of Trees (https://www.youtube.com/watch?v=xy86ak2fQJM) The data is about the different ecological interactions that are displayed in the video. The data frame has 3 columns: Participante_1 that is the name of one species, Paticipante_2 that is the other species that interacts with the first one, and the third column is the type of ecological interaction (competition, parasitism, mutualism, etc)

data<-read.table("taller4.txt",header = T)
especies<-c(data$Paticipante_1,data$Participante_2) #This are the species identified in the video
unique(especies) #Some of the species had multiple interactions, so they're repited, so this command makes a list of the species avoiding repetition.

library(igraph) #This package is needed to make the plot#

red<-graph_from_data_frame(d=data,directed = FALSE,vertices=unique(especies)) 
plot(red)
