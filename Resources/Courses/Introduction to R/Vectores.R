N=c(1,5,6,2,5,7,8,3,5,2,1,0) #Vector con números
nombres=c("Pepe","Cata","Juani","Pau") #Vector con nombres
notas=scan("Notas - Hoja1.csv") # Copia contenido de "Notas - Hoja1.csv" en un vector

# Si ejecutamos la instrucción scan() (así, con el argumento vacío), 
# R abre en la consola un entorno de diálogo (con el número 1:) 
# donde podemos ir entrando datos separados por espacios en blanco; 
# cada vez que pulsemos la tecla Entrar, R importará los datos 
# que hayamos escrito desde la vez anterior en que la pulsamos 
# y abrirá una nueva línea donde esperará más datos; cuando hayamos acabado, 
# dejamos la última línea en blanco pulsando por última vez la tecla Entrar 
# (en el ejemplo siguiente 13: ) y R cerrará el vector.

table(notas) # crea tabla de frecuencias absolutas
pie(table(notas)) # crear gráfico circular.
barplot(table(notas)) # crear gráfico de barras.
pie(table(vector_con_data_frame)) # crear gráfico circular con excel importado
fix(vector_con_data_frame) # modificar vector
Hermanos=tabla$`Número de hermanos`#vector creado a partir de la columna Número de hermanos del dataframe importado 'tabla'
table(Hermanos) # tabla de hermanos
pie(table(Hermanos)) #gráfico de torta
barplot(table(Hermanos)) #grafico de barra