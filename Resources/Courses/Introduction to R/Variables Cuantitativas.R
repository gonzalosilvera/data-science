str(DatosEstudiantes)
attach(DatosEstudiantes)
table(Peso) #Frecuencias absolutas
prop.table(table(Peso)) #Frecuencias relativas
cumsum(table(Peso)) #Frecuencias absolutas acumulafas
cumsum(prop.table(table(Peso))) #Frecuencias relativas acumuladas
mean(Peso) #media
median(Peso) #mediana
as.numeric(names(which(table(Peso)==max(table(Peso))))) #moda
#Cuartiles
quantile(Peso,0.25)
quantile(Peso,0.50)
quantile(Peso,0.75)
boxplot(Peso)
boxplot(Sepal.Length~Species,data=iris,ylab="Longitudes de sépalos (cm)",main="Tabla Iris", col=c("red","blue","green"))
str(boxplot(Sepal.Length~Species))
boxplot(Sepal.Length~Species)$stats
boxplot(Sepal.Length~Species)$out
boxplot(Sepal.Length~Species)$group
hist(Peso, col=c("red","yellow","blue","pink","green","orange","black","white"))

table: calcula la tabla de frecuencias absolutas de un vector.
prop.table: calcula la tabla de frecuencias rela3vas de un vector a par3r de su tabla
de frecuencias absolutas.
cumsum: calcula las sumas acumuladas de un vector.
as.vector: transforma un objeto en un vector.
mean: calcula la media de un vector numérico.
median: calcula la mediana de un vector numérico.
as.numeric(names(which(table(x)==max(table(x))))) calcula la moda del vector x.
quantile(x, p) calcula el cuan3l de orden p del vector numérico x. 

range produce un vector con el mínimo y el máximo de un vector numérico.
QR calcula el rango intercuar7lico de un vector numérico. El parámetro type
permite
especificar el método de cálculo de los cuan;les.
var calcula la varianza muestral de un vector numérico.
sd calcula la desviación 7pica muestral de un vector numérico.
summary, aplicado a un vector numérico, calcula sus extremos, sus cuar;les
y su media; aplicado a un data frame, calcula resúmenes similares para todas sus
variables.
by(data frame, factor, FUN=función)
aplica la función a las variables del data frame segmentadas según el factor. 

boxplot dibuja los diagramas de caja de los vectores numéricos a los que se aplica.
Algunos parámetros importantes: 
  
•Los de plot que tengan sen<do.
•horizontal: igualado a TRUE, dibuja las cajas horizontales.
•names: sirve para especificar los nombres bajo los diagramas de caja en un gráfico
que contenga varios.
•notch: dibuja cinturas alrededor de las medianas que permiten contrastar si las
medianas poblacionales son diferentes.
•plot: igualado a FALSE calcula el diagrama de caja, pero no lo dibuja.
Como objeto de datos, el resultado de esta función es una list entre cuyas
Componentes destacamos:
•stats: con<ene, para cada diagrama de caja en el gráfico, las ordenadas de sus
cinco líneas horizontales: binf , Q0.25, Q0.5, Q0.75, bsup.
•out: con<ene los valores aQpicos.
•group: indica los diagramas a los que pertenecen los valores aQpicos. 