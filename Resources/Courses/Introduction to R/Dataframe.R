#RCero - Data Frame

help(iris) # Información sobre Dataset Iris que viene con R
d.f = iris # almacenar Iris en un Data Frame (tabla de doble entrada)
View(d.f) # Ver Data Frame almacenado
head(d.f,5) # Muestra primeras 5 filas de la tabla
tail(d.f,5) # Muestra últimas 5 filas de la tabla
str(d.f) # ver estructura global de tabla
names(d.f) # Produce un vector con los nombres de las columnas.
rownames(d.f) # Produce un vector con los identificadores de las filas.
dimnames(d.f) # Produce una list formada por dos vectores: el de los identificadores de las filas y el de los nombres de las columnas.
dim(d.f) # Produce un vector con el número de filas y el número de columnas.
d.f$Sepal.Length[1:50] # Los valores del 1 al 50 de la columna Sepal.Length de dataframe d.f.
attach(d.f) # declarar todas las variables de un dataframe como internas
detach(d.f) # devuelva la situación iringal, eliminando del entorno global las variables del dataframe.
barplot(table(Petal.Width), main = "Frecuencias absolutas Petal.Width", col = rainbow(22), ylim = c(0,30)) # Gráficar frecuencias absolutas de la columna Petal.Width de d.f

#Crear Dataframe
edad=c(1,2,3,5,7,9,11,13)#Vector edad
altura=c(76.11, 86.45, 95.27, 109.18, 122.03, 133.73, 143.73, 156.41)#vector altura
datos1=data.frame(edad, altura)#dataframe creado a partir de edad y altura como columnas

NH1=read.table("NotaHermanos.txt", header=TRUE) # Crear data frame a partir de archivo txt
NH2=read.table("NotaHermanosc.txt", header=TRUE, sep=",") # Crear data frame con valores separados por coma

write.table(d.f, file = "d.f.txt", sep = "\t", eol = "\n", dec = ".", row.names = TRUE, col.names = TRUE) # Guardar tabla en formato txt en carpeta de trabajo