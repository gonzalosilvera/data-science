pulse=read.table("pulse.txt", header=TRUE, sep="\t") #crear dataframe pulse con archivo pulse.txt
table(pulse$PuBefor) # frecuencias absolutas de la variable PuBefor
barplot(table(pulse$PuBefor)) # gráfico de barras
