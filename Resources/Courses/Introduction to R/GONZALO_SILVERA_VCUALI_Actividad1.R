install.packages("MASS")
library(MASS)
fpnn=data.frame(MASS::birthwt)
str(fpnn)
attach(fpnn)
min(age)
max(age)
mean(age)
table(age)

smokefactor=factor(smoke, labels = c("No","Yes"))

barplot(table(smokefactor), main = "Fumadores", ylim=c(0,120), col = c("red","blue"))

pie(table(smokefactor), col = c("red","blue"), main = "Fumadores")