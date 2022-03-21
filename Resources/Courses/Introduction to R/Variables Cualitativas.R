#Importar tabla
library(readxl)library(readxl)
DatosEstudiantes <- read_excel("DatosEstudiantes.xlsx", col_types = c("skip", "text", "text", "text", "numeric", "numeric", "numeric"))
View(DatosEstudiantes)
str(DatosEstudiantes)
attach(DatosEstudiantes)

#Tablas de frecuencias absolutas
table(Corre)
table(Fuma)
table(Sexo)

#Tablas de frecuencias absolutas bidimensionales
table(Corre,Fuma)
table(Corre,Sexo)
table(Sexo,Fuma)

#Tablas de frecuencias absolutas tridimensionales
ftable(Corre,Sexo,Fuma)
ftable(Corre,Fuma,Sexo)

#Tablas de frecuencias relativas
prop.table(table(Corre))

#Tablas de frecuencias relativas globales 
prop.table(table(Corre,Sexo))

#Tablas de frecuencias relativas marginales
prop.table(table(Sexo, Fuma), margin=1)
prop.table(table(Sexo, Fuma), margin=2)

#Tablas de frecuencias relativas globales tridimensionales
prop.table(ftable(Corre,Sexo,Fuma))

#Tablas de frecuencias relativas marginales tridimensionales
prop.table(table(Corre, Sexo, Fuma), margin=3)
prop.table(table(Corre, Sexo, Fuma), margin=1)

#Diagrama de barras
barplot(table(Sexo), col=c("blue", "red"), main="Frecuencias Absolutas \n Variable Sexo", horiz = FALSE , ylim=c(0,60), ylab="Frecuencias Absolutas")

#Diagrama de barras apiladas
barplot(table(Fuma, Sexo), names=c("female", "male"), col=c("orange", "red"), legend.text = c("no", "yes"), xlim = c(0,100), horiz = TRUE)

#Diagrama circular
pie(table(Fuma), main="Diagrama circular de la variable\"Fuma\"" , col = c("red", "yellow"))

#Agregar etiquetas y colores
etiquetas=c("Nada","Bajo","Moderado","Alto")
colores=c("red","orange","yellow","green")
pie(table('Nivel de AF'), labels = etiquetas, col = colores, main = "Nivel de Actividad Física")

#Frecuencias Relativas
barplot(prop.table(table(Sexo)), main = "Frecuencias Relativas \n Variable Sexo", ylab = "Frecuencias relativas", col = c("orange","red"))

• table calcula la tabla de frecuencias absolutas de un vector o un factor.
• as.table convierte un objeto (por ejemplo, una matriz) en una tabla de con9ngencia.
• )able muestra una tabla mul9dimensional en formato plano.
• t sirve para trasponer una tabla bidimensional.
• aperm sirve para permutar las variables de una tabla mul9dimensional.
• prop.table calcula la tabla de frecuencias rela9vas de un vector o un factor a par9r de su
tabla de frecuencias absolutas. Tiene el parámetro siguiente: margin: sirve para especificar
las dimensiones en cuyos niveles se calcularán las fre- cuencias rela9vas marginales. Si no
se especifica, se calculan las frecuencias rela9vas globales.
• CrossTable, del paquete gmodels, produce, en el caso bidimensional, una tabla conjunta de
frecuencias absolutas y de frecuencias rela9vas globales y marginales.
• names da los nombres de las columnas de una tabla unidimensional, y sirve también para
modificar estos nombres. 

• dimnames da una list con los vectores de los nombres de los niveles de las diferentes
variables de una tabla mul2dimensional, y sirve también para modificar los nombres tanto
de las variables como de sus niveles.
• tabla[...] se usa para especificar un elemento, una fila, una columna o una subtabla de la
tabla.
• barplot dibuja el diagrama de barras de un vector o un factor a par2r de una tabla de
frecuencias. Algunos parámetros importantes:
  col: sirve para especificar los colores de las barras.
horiz=TRUE: sirve para dibujar el diagrama horizontal.
beside=TRUE: sirve para especificar que el diagrama sea por bloques.
legend.text: sirve para añadir una leyenda que explique qué barras corresponden a
cada uno de los niveles de la primera variable.
args.legend: sirve para modificar las caracterís2cas de esta leyenda, igualándolo a
una list con los valores de los parámetros de la función legend que queramos
especificar.
names: sirve para cambiar en el diagrama los nombres de los niveles de la segunda
variable.
main, xlab, ylab y el resto de parámetros de plot que tengan sen2do para diagramas
de barras. 

• pie dibuja el diagrama circular de un vector o un factor a par4r de una tabla de frecuencias.
Algunos parámetros importantes:
  col: sirve para especificar los colores de los sectores.
names: sirve para cambiar en el diagrama los nombres de los niveles.
main, xlab, ylab y el resto de parámetros de plot que tengan sen4do para
diagramas circulares.
