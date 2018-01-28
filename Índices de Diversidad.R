library(vegan)
#Datos son la matriz de contingencia del muestreo
data(BCI)
S<-specnumber(BCI) # Riqueza de especies

Simpson<-diversity(BCI, index = "simpson") 

Shannon<-diversity(BCI, index = "shannon", base = exp(1)) #base: calcula Shannon en base logarítmica indicada (i.e. e^S)

alfa.fisher<-fisher.alpha(BCI)
