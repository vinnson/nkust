iconv  -c -f BIG5 -t UTF-8 202008.csv
iconv  -c -f US-ASCII -t UTF-8 202008.csv
iconv  -c -f iso-8859-1 -t UTF-8 202008.csv


iconv -f iso-8859-1 -t  202008.csv
iconv -f UTF-8 -t UTF-16LE 202008.csv


file -I 202008.csv

# libxml2 libxml2-dev libglpk-dev
