## RCero - Gonzalo Silvera
## Gráficos sobre Plan de Vacunación Covid 19. 
## Datos acumulados por día de los actos vacunales. Se presentan totales diarios por tipo de vacuna, dosis, departamentos y rangos etarios.
## Base de datos recuperada de https://catalogodatos.gub.uy/

# Cargar librería para importar archivo csv
library(readr)
# Url donde se encuentra el archivo csv con los datos que se desea importar
url <- "https://catalogodatos.gub.uy/dataset/e766fbf7-0cc5-4b9a-a093-b56e91e88133/resource/5c549ba0-126b-45e0-b43f-b0eea72cf2cf/download/actos_vacunales.csv"
# Crear dataframe a partir de url
actos_vacunales <- read_delim(url, delim = ";", escape_double = FALSE, col_types = cols(Fecha = col_date(format = "%d/%m/%Y")), trim_ws = TRUE)
# Ver dataframe
View(actos_vacunales)

# Total de 1ra y 2da dosis administradas para cada tipo de vacuna
actos_total=c(sum(actos_vacunales[,4:5]),sum(actos_vacunales[,6:7]),sum(actos_vacunales[,8:9]))
# Frecuencias relativas de actos vacunales
actos_frel= prop.table(actos_total)
# Colores para tipos de vacuna
colores=c("coral2","cadetblue2","darkolivegreen2")
# Etiqueta para tipos de vacuna y porcentaje de actos vacunales correspondientes
etiquetas= paste(c("Sinovac","Pfizer","Astrazeneca"),"\n",round(actos_frel*100,2), "%", sep = "")
# Gráfico de torta con título "Total de actos vacunales por tipo de vacuna"
pie(actos_frel, labels = etiquetas, col = colores, main = "Total de actos vacunales por tipo de vacuna")

# Ordenar dataframe actos_vacunales por fecha
actos_vacunales=actos_vacunales[order(actos_vacunales$Fecha),]
# Modificar formato de fecha: mes en formato numérico
Mes=format(actos_vacunales$Fecha, "%m")
# Sumar filas de 1ra y 2da dosis de Sinovac
Sinovac=rowSums(actos_vacunales[,4:5])
# Sumar filas de 1ra y 2da dosis de Pfizer
Pfizer=rowSums(actos_vacunales[,6:7])
# Sumar filas de 1ra y 2da dosis de Astrazeneca
Astrazeneca=rowSums(actos_vacunales[,8:9])
# Crear dataframe con actos vacunales por tipo de vacuna
actos_tipoxmes=data.frame(Mes, Sinovac, Pfizer,Astrazeneca)
# Agrupar actos vacunales por mes
actos_xtipo = aggregate(actos_tipoxmes[,2:4], by=list(Mes), FUN = sum)
# Transponer dataframe
actos_xmes = t(actos_xtipo[2:4])
# Crear vector con meses
Meses=c("Febrero", "Marzo", "Abril", "Mayo","Junio","Julio","Agosto")
# Renombrar columnas
colnames(actos_xmes)<-Meses
# Gráfico de barras con título "Actos vacunales por mes"
barplot(actos_xmes, col=colores, legend.text = c("Sinovac", "Pfizer","Astrazeneca"), main = "Actos vacunales por mes", ylim=c(0,1200000), ylab = "Actos vacunales", xlab = "Meses")
