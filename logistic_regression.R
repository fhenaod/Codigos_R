tab<-read.csv("~/Desktop/Libro2.csv", header=T, sep=";")
m1<-glm(atenines.present~fruit.prod,family=binomial(link='logit'),data=tab)
m2<-glm(lagothirx.present~fruit.prod,family=binomial(link='logit'),data=tab)

summary(m1)
summary(m2)

plot(tab$fruit.prod,tab$lagothirx.present,xlab="Fruit production (kg / ha·yr)",ylab="Lagothrix presence probability")
curve(predict(m2,data.frame(fruit.prod=x),type="resp"),add=TRUE)
points(tab$fruit.prod,fitted(m2),pch=20)

library(popbio)
logi.hist.plot(tab$fruit.prod,tab$lagothirx.present,boxp=F, rug=T,type="hist",col="lightgray",xlabel="Fruit production (kg / ha·yr)")

