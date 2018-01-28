## ANOVA
anova<-aov(npk$yield~npk$block)
anova(anova) # Calcula valores-p más precisos que summary(), especialmente con varios factores

#post-hoc 
TukeyHSD(anova)

## Kruskall-Wallis
kruskal<-kruskal.test(npk$yield~npk$block)

#post-hoc pareado con corrección Bonferroni
pairwise.wilcox.test(npk$yield,npk$block, p.adj="bonferroni",exact=F)
