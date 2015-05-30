#hola, esta es la tarea 1

mkdir Miguel
cd Miguel
wget https://github.com/spsaaibi/ComputationalToolsData/raw/master/data/HYG/hyg.tar.gz
gunzip hyg.tar.gz
tar -xvf hyg.tar
rm hyg.tar

grep Regulus hyg.csv

grep -v ^# hyg.csv > 1.csv
sed "1 d" 1.csv > 2.csv
sed "1 d" 2.csv > 3.csv
sed "1 d" 3.csv > datos.csv
rm 1.csv
rm 2.csv
rm 3.csv
wc -l datos.csv

wc hyg.csv

grep G2 hyg.csv > g2.csv
wc -l g2.csv

grep -i  ",G2," hyg.csv > g.csv
head -32 hyg.csv > head.csv
cat  head.csv g.csv> EstrellasG2.csv
rm g.csv
rm g2.csv
rm head.csv

grep G2V hyg.csv > g2v.csv

awk -F "," '$10>10 && $10<50 && $16=="G2V"' g2v.csv > EstrellasG2V_10-50_ly.csv


sed 's/^/Estrellas especiales, /' EstrellasG2V_10-50_ly.csv > Temp.csv
sed 's/$/,enero-2015/' Temp.csv > EstrellasG2V_10-50_ly_2.csv

tar -cvf EstrellasG2V_10-50_ly_ng.csv.tar EstrellasG2V_10-50_ly_2.csv
gzip EstrellasG2V_10-50_ly_ng.csv.tar




