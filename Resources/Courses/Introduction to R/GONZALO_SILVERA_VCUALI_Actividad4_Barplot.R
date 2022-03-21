install.packages("MASS")
library(MASS)
fpnn=data.frame(MASS::birthwt)
str(fpnn)
attach(fpnn)

#A
prop.table(table(race,low), margin=1)

frmMASS = prop.table(table(race,low), margin=1)
barplot(frmMASS, main = "Frecuencias relativas marginales", ylim=c(0,3), horiz = FALSE)
