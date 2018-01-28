library(vegan)
sp=read.delim(file.choose(), header=T)
bosque=read.delim(file.choose(), header=T)
adonis(sp ~ bosque[1:32,2], permutations=999, method="chao")
