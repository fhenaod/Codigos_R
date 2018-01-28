x_BT<-branching.times(Filogenia)   # Estima las longitudes de ramas de una filogenia dada

gamStat(x_BT)   #Estima el estadístico gamma de Pybus and Harvey(2000)

mccrTest(CladeSize, NumberMissing, NumberOfReps, ObservedGamma = NULL, fname=NULL) 	# Conducts gamma statistic analysis (Pybus and Harvey 2000) for incompletely sampled phylogenies. Phylogenies are simulated to the full clade 	size under the null hypothesis (constant rate pure birth diversification process) and taxa are randomly pruned from the tree to mimic incomplete sampling. The null distribution of the gamma statistic is then tabulated from these phylogenies.

plotLtt(x_BT)	#Grafica en un  LTT de las longitudes de las ramas 

is.ultrametric(Filogenia) #Prueba de respuesta binaria para comprobar si la filogenia es ultramétrica  

pureBirth(x)  #Fits pure birth (Yule) model to set of branching times 

fitdAICrc(x, modelset = c("pureBirth", "bd", "DDL", "DDX", "yule2rate"), ints = NULL) #Fits a specified set of rate-variable and rate-constant variants of the birth-death model to branching times from phylogenetic data. The test statistic dAICrc is the difference in AIC scores between the best rate-constant and rate-variable models. 

DDX(x) & DDL(x) #Functions that fit density-dependent speciation rate models to branching times derived from phylogenetic data. DDX and DDL fit exponential and logistic variants of the density-dependent speciation rate model. 

ltt.plot.coords(x_tree) # Para obtener las coordenadas de un LTT plot

>>Para traficar las Log-verosim de las tasas Vs tiempo de divergencia

Nombre resultado<- MODELO (x_BT, ints=NULL, verbose=TRUE, file="NOMBRE.txt") #Obtiene e imprime en un archivo .txt las verosimilitudes del modelo (puede ser otro i.e: bd, DDL, DDX)

x_LH<-read.table(file="NOMBRE.txt", header=TRUE) # Lee las verisimilitudes del archivo anterior

x_LHtable<- (x_BT[1] - x_LH$st1) # Tabla con el re-escalamiento de las los cambios de especiacion 

plot(x_LH$LH~x_LHtable, type="l") # Grafíca las verosimilitudes contra tiempo de divergencia