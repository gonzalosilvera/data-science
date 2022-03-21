install.packages("MASS")
library(MASS)
fpnn=data.frame(MASS::birthwt)
attach(fpnn)

smokefactor=factor(smoke, labels = c("No","Yes"))

barplot(table(smokefactor), main = "Fumadores", ylim=c(0,120), col = c("red","blue"))

pie(table(smokefactor), col = c("red","blue"), main = "Fumadores")