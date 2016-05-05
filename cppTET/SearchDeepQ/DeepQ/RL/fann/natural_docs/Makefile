all:
	perl NaturalDocs -cs iso-8859-1 -i ../src/include/ -i ../doc/ -o HTML test/doc/ -p test/project/ -s Default fann -r
	rm -rf ~/nfs/public_html/fann2.0/html
	cp -a test/doc /media/nfswww/fann/html_latest

pol:
	perl NaturalDocs -cs Windows-1250 -i ../translations/polish/2.0.0/include/ -i ../translations/polish/2.0.0/doc/ -o HTML polish/doc/ -p polish/project/ -s Default fann -r
	rm -rf ~/nfs/public_html/fann_polish/
	cp -a polish/doc ~/nfs/public_html/fann_polish/


frame:
	perl NaturalDocs -i ../src/include/ -i ../doc/ -o FramedHTML test/doc/ -p test/project/ -s Default fann

clean:
	perl NaturalDocs -i ../src/include/ -i ../doc/ -o HTML test/doc/ -p test/project/ -s Default fann -r
