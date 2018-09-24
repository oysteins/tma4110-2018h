#!/bin/bash

# Kjør kommandoen
#
#   ./publiser-notat.sh [notatfil]
#
# for å publisere et notat til nettsiden.  Du får ut URL-en notatet
# blir tilgjengelig på.  Du må selv lage en link til denne URL-en fra
# wikien.
#
# Eksempel:
#
#   ./publiser-notat.sh 04-matriser.pdf

fag="TMA4110"
semester="2018h"
kategori="notater"
file=$1
if [ -z "$file" ]
then
    echo "Jeg vil ha et filnavn som argument."
    exit
fi
if [ ! -e $file ]
then
    echo "Filen $file eksisterer ikke."
    exit
fi
filename=$(basename $file)
dest=/global/www/webroot/emner/$fag/$semester/$kategori
destfile=$dest/$filename
baseurl=https://www.math.ntnu.no/emner/$fag/$semester/$kategori
url=$baseurl/$filename
host=login.math.ntnu.no

echo scp $file $host:$destfile
scp $file $host:$destfile
echo ssh $host chmod u=rw,g=r,o=r $destfile
ssh $host chmod u=rw,g=r,o=r $destfile
echo $url
