#hola, esta es la tarea 1 Catalogo Estelar

#Punto a) Creacion Directorio, Descarga, Descomprecion, Borrado


gunzip hyg.tar.gz
tar -xvf hyg.tar
rm hyg.tar

#Punto b) Impresion del catalogo Regulos
grep Regulus hyg.csv

#Punto c) 
#Eliminacion Comentarios,
grep -v ^# hyg.csv > 1.csv
# Eliminacion filas y encabezado
sed "1 d" 1.csv > 2.csv
sed "1 d" 2.csv > 3.csv
sed "1 d" 3.csv > datos.csv
#Eliminacion archivos temporales
rm 1.csv
rm 2.csv
rm 3.csv
#Conteo de estrellas
wc -l datos.csv
rm datos.csv


#Punto d) Lineas, palabras y bytes catalogo
wc hyg.csv

#Punto e) Conteo de estrellas con clasificacion G2
grep G2 hyg.csv > g2.csv
wc -l g2.csv

#Punto f) Catalogo parcial Estrellas G2 exclusivamente
grep -i  ",G2," hyg.csv > g.csv
head -32 hyg.csv > head.csv
cat  head.csv g.csv> EstrellasG2.csv
rm g.csv
rm g2.csv
rm head.csv

# Punto g)Catalogo parcial Estrellas G2V entre 10 y 50 años luz
grep G2V hyg.csv > g2v.csv
awk -F "," '$10>10 && $10<50 && $16=="G2V"' g2v.csv > EstrellasG2V_10-50_ly.csv
rm g2v.csv

#Punto h) Adicion de caracteres
sed 's/^/Estrellas especiales, /' EstrellasG2V_10-50_ly.csv > Temp.csv
sed 's/$/,enero-2015/' Temp.csv > EstrellasG2V_10-50_ly_2.csv
rm Temp.csv

#Punto i) Compresion archivo
tar -cvf EstrellasG2V_10-50_ly_ng.tar EstrellasG2V_10-50_ly_2.csv
gzip EstrellasG2V_10-50_ly_ng.tar




