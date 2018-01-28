library(pegas)
library(adegenet)
library(genetics)

datos<-read.genetix("")
datos<-read.genepop("")
datos<-read.structure("")

dapc1<-dapc(datos, n.pca=3) # Discriminant Analysis of Principal Components (DAPC)
scatter(dapc1, scree.da=FALSE)
loadingplot(dapc1$var.contr)

dist.genpop(as.genpop(datos), method=1) # Distancia Nei

pairwise.fst(datos, truenames=T) # Fst pareado
Hs(datos) # Heterocigocidad esperada
HWE.test(datos, res.type="matrix")
inbreeding(datos, N=30)
______
datosAl<-as.loci(datos) # Conversion formato PEGAS
datosAl
class(datosAl)
fix(datos)
as.loci(datosAl,allele.sep="/")
datosHap<-haplotype(datosAl, locus=1:6) 

net<-haploNet(haplotype(as.loci(datos,allele.sep="/"))) # Red haplotipos