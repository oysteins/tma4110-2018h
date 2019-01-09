#!/bin/bash

kapitler="00-introduksjon.tex
          01-lineare-likningssystemer.tex
          02-gausseliminasjon.tex
          03-vektor-og-matriselikninger.tex
          04-matriser.tex
          05-linear-uavhengighet.tex
          06-determinanter.tex
          07-egenverdier-og-egenvektorer.tex
          08-vektorrom.tex
          09-lineartransformasjoner.tex
          10-komplekse-tall.tex
          11-kompleks-linear-algebra.tex
          12-projeksjon.tex
          13-diagonalisering.tex
          14-systemer-av-lineare-differensiallikninger.tex
          15-andre-ordens-lineare-differensiallikninger.tex
         "

pdflatex tma4110-2018h.tex
pdflatex tma4110-2018h.tex

for kap in $kapitler
do
    pdflatex $kap
    pdflatex $kap
done

for oving in oving{01..12}.tex
do
    pdflatex $oving
    pdflatex $oving
done

for lf in lf{01..12}.tex
do
    pdflatex $lf
    pdflatex $lf
done

for eks in eks{1,2}.tex
do
    pdflatex $eks
    pdflatex $eks
done
