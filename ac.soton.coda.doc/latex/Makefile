default: pdfs

all: pdfs htmls

##### Making PDFs (BEGIN) #####
pdfs: user_manual.pdf vhdl/vhdl_user_manual.pdf

user_manual.pdf: $(shell find . -name *.tex -type f) $(shell find . -name *.sty -type f)
	pdflatex user_manual.tex
	pdflatex user_manual.tex

vhdl/vhdl_user_manual.pdf: vhdl/plastex.sty $(shell find vhdl -name *.tex -type f) $(shell find vhdl -name *.sty -type f)
	cd vhdl;pdflatex vhdl_user_manual.tex
	cd vhdl;pdflatex vhdl_user_manual.tex

vhdl/plastex.sty: plastex.sty
	cp -rf plastex.sty vhdl/plastex.sty

##### Making PDFs (END) #####

##### Making HTMLs (BEGIN) #####

htmls: vhdl-html

vhdl-html: vhdl-html-remove vhdl-html-generate vhdl-clean

vhdl-html-remove:
	rm -rf ../../ac.soton.coda.vhdl.doc/html

vhdl-html-generate:
	cd vhdl;plastex -d ../../../ac.soton.coda.vhdl.doc/html/ --theme=python vhdl_user_manual.tex

##### Making HTMLs (END) #####

##### Clean (BEGIN) #####

vhdl-clean:
	rm -rf vhdl/*.aux vhdl/*.log vhdl/*.rel vhdl/*.paux vhdl/*.synctex.gz

vhdl-clean-all: vhdl-clean vhdl-remove 
	rm -rf vhdl/vhdl_user_manual.pdf

clean: vhdl-clean
	rm -rf *.aux *.log *.rel *.paux *.synctex.gz

clean-all: clean vhdl-clean-all
	rm user_manual.pdf

##### Clean (END) #####
