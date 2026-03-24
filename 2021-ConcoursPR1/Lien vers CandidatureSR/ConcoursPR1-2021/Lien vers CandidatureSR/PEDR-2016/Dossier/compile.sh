rm PEDR2016_ROBIN_Stephane_40205B.aux
pdflatex PEDR2016_ROBIN_Stephane_40205B
for file in *.aux ; do
	bibtex `basename $file .aux`
done
pdflatex PEDR2016_ROBIN_Stephane_40205B
pdflatex PEDR2016_ROBIN_Stephane_40205B

