rm ROBIN.rapport.aux
pdflatex ROBIN.rapport
for file in *.aux ; do
	bibtex `basename $file .aux`
done
pdflatex ROBIN.rapport
pdflatex ROBIN.rapport

