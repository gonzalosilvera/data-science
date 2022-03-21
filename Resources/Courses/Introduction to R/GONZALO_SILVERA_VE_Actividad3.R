# RCero
# Vectores - Actividad 3
# Gonzalo Silvera

x=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20) # vector númerico
length(x) #calcula la longitud del vector.
max(x) # calculan sus valores máximo. 
min(x) # calculan sus valores mínimo. 
sum(x) # calcula la suma de sus entradas.
mean(x) #calcula la media aritmética, o sea, el promedio de sus entradas. 
sort(x) # ordena los elementos del vector en el orden natural creciente del tipo de datos que lo forman: el orden numérico, el orden alfabético, etc. Si lo queremos ordenar en orden decreciente, podemos incluir en su argumento el parámetro dec=TRUE. 
rev(x) # invierte el orden de los elementos del vector; por lo tanto, rev(sort(...)) es otra opción para ordenar en orden decreciente.
cumsum(x) # calcula el vector formado por las sumas acumuladas de las entradas del vector original: cada entrada de cumsum(x) es la suma de las entradas de x hasta su posición. 
fix(x) # abre el vector en una ventana externa y permite modificarlo.