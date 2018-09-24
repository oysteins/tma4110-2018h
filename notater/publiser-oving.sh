#!/bin/bash

# Kjør kommandoen
#
#   ./publiser-oving.sh [øvingsfil]
#
# for å publisere en øving eller et løsningsforslag til nettsiden.  Du
# får ut URL-en filen blir tilgjengelig på.  Du må selv lage en link
# til denne URL-en fra wikien.
#
# Eksempler:
#
#   ./publiser-oving.sh oving01.pdf
#   ./publiser-oving.sh lf01.pdf

fag="TMA4110"
semester="2018h"
kategori="ovinger"
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
