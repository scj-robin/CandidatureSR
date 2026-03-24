rm ROBIN.rapport.aux
rm ROBIN.rapport.bbl
rm ROBIN.rapport.blg
pdflatex ROBIN.rapport
for file in *.aux ; do
	bibtex `basename $file .aux`
done
pdflatex ROBIN.rapport
pdflatex ROBIN.rapport

