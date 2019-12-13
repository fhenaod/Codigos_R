library(vegan)
x<-read.delim("",h=T,sep=";") # Cargar archivo delimitado por ;
xx<-x[,2:dim(x)[2]] # Nombres en primera columna
row.names(xx)=x[,1]

dist<-vegdist(xx,method="bray") # Matriz distancia Bray-Curtis

#### NMDS
nmds<-metaMDS(xx,distance="bray",trymax=1000,autotransform=FALSE)
stressplot(nmds)						# Visualizar stress
nmds1<-plot(nmds, type="t")			# Gráfica especial ordenaciones, type="p":puntos, "t":nombres variables
nmds2<-ordiplot(nmds$sites, type="t", cex=.8, cex.axis=1, cex.lab=1.5)
nmds2<-ordiplot(mds1$species, type="t", cex=1.5)

treat<-c(rep("S1",6),"S2","S2","S3",rep("S1",4),rep("S2",4),rep("S3",5)) # Vector con categorías 
ordihull(nmds2, groups=treat, draw="polygon", col="grey")
ordiellipse(nmds2, groups=treat, kind="ehull", conf=0.95 ,draw="polygon", col="grey")
ordispider(nmds2, groups=treat,spiders="centroid",col="gray")
ordicluster(nmds2,3, groups=treat, col="gray")

type="p" # grafica con puntos
type="t" # grafica con nombres de las variables 

plot(nmds)
points(nmds$sites,col="blue")
points(nmds1$species[2,1],nmds1$species[2,2],pch=1)
points(nmds1$species[7,1],nmds1$species[7,2],pch=2)# Agregar puntos a la gráfica selecionándolos 

guac<-matrix(c(35,0 ,79,4),ncol=2,nrow=2,byrow=T, dimnames=list(Focal=c("AF","AM"),Neighbors=c("ma", "H"))) ## Ejemplo construccion matriz

# **Rule of thumb: stress > 0.05 excellent representation in reduced dimensions, > 0.1 great, >0.2  good/ok, and stress > 0.3 provides poor representation.** #

#### ANOSIM
xx.anosim<-anosim(xx,treat,distance="bray",permutations=1000)
xx.anosim
plot(xx.anosim)

#### Procrustes test between Ordination scores
proc.test<-protest(nms.test, nms.retest, scores = "sites", permutations = how(nperm=10000))
proc.test
plot(proc.test)
