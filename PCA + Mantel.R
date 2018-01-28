library(vegan)
amb<-read.delim(file.choose(), header=T)

pca<-prcomp(~bosque+Temp+Preci+Carbon+Nitrogen+inundacion+CIC+Ar+L+A+Min_preci+T_min+pH, data=amb, scale=T, na.action=na.omit)
pc<-scores(pca, display="sites")
mamb<-egdist(pc,"euclid",na.rm=T)

coor<-read.delim(file.choose(), header=T)
dist<-dist(cbind(coor$Longitud, coor$Latitud))
mantel(dist,mamb, method="pearson")
plot(dist, mamb, xlim=c(0,10), ylim=c(-1, 8))