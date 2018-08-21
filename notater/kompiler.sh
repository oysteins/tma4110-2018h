#!/bin/bash

kapitler="00-introduksjon.tex
          01-lineare-likningssystemer.tex
          02-gausseliminasjon.tex
          03-vektor-og-matriselikninger.tex
         "

pdflatex tma4110-2018h.tex
pdflatex tma4110-2018h.tex

for kap in $kapitler
do
    pdflatex $kap
    pdflatex $kap
done

for oving in oving{01..01}.tex
do
    pdflatex $oving
    pdflatex $oving
done

for lf in lf{01..01}.tex
do
    pdflatex $lf
    pdflatex $lf
done
