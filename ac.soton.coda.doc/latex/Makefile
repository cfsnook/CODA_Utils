default: pdfs

all: pdfs htmls

component_diagrams: component_diagrams-pdf component_diagrams-html

simulator2: simulator2-pdf simulator2-html

vhdl: vhdl-pdf vhdl-html

##### Making PDFs (BEGIN) #####
pdfs: user_manual.pdf component_diagrams-pdf vhdl-pdf

user_manual.pdf: $(shell find . -name "*.tex" -type f) $(shell find . -name "*.sty" -type f)
	pdflatex user_manual.tex
	pdflatex user_manual.tex

component_diagrams-pdf: component_diagrams/component_diagrams-user_manual.pdf

component_diagrams/component_diagrams-user_manual.pdf: component_diagrams/plastex.sty $(shell find component_diagrams -name "*.tex" -type f) $(shell find component_diagrams -name "*.sty" -type f)
	cd component_diagrams;pdflatex component_diagrams-user_manual.tex
	cd component_diagrams;pdflatex component_diagrams-user_manual.tex

component_diagrams/plastex.sty: plastex.sty
	cp -rf plastex.sty component_diagrams/plastex.sty

simulator2-pdf: simulator2/simulator2-user_manual.pdf

simulator2/simulator2-user_manual.pdf: simulator2/plastex.sty $(shell find simulator2 -name "*.tex" -type f) $(shell find simulator2 -name "*.sty" -type f)
	cd simulator2;pdflatex simulator2-user_manual.tex
	cd simulator2;pdflatex simulator2-user_manual.tex

simulator2/plastex.sty: plastex.sty
	cp -rf plastex.sty simulator2/plastex.sty

##### Making PDFs (END) #####

##### Making HTMLs (BEGIN) #####

htmls: component_diagrams-html simulator2-html vhdl-html

component_diagrams-html: ../../ac.soton.eventb.emf.components.doc/html/index.html

../../ac.soton.eventb.emf.components.doc/html/index.html: component_diagrams/plastex.sty $(shell find component_diagrams -name "*.tex" -type f) $(shell find component_diagrams -name "*.sty" -type f)
	rm -rf ../../ac.soton.eventb.emf.components.doc/html
	cd component_diagrams;plastex -d ../../../ac.soton.eventb.emf.components.doc/html/ --theme=python component_diagrams-user_manual.tex

simulator2-html: ../../ac.soton.coda.simulator2.doc/html/index.html

../../ac.soton.coda.simulator2.doc/html/index.html: simulator2/plastex.sty $(shell find simulator2 -name "*.tex" -type f) $(shell find simulator2 -name "*.sty" -type f)
	rm -rf ../../ac.soton.coda.simulator2.doc/html
	cd simulator2;plastex -d ../../../ac.soton.coda.simulator2.doc/html/ --theme=python simulator2-user_manual.tex

vhdl-html: ../../ac.soton.coda.vhdl.doc/html/index.html

../../ac.soton.coda.vhdl.doc/html/index.html: vhdl/coda-user_agreement.tex vhdl/coda.sty vhdl/eventB.sty vhdl/plastex.sty $(shell find vhdl -name "*.tex" -type f) $(shell find vhdl -name "*.sty" -type f)
	rm -rf ../../ac.soton.coda.vhdl.doc/html
	cd vhdl;plastex -d ../../../ac.soton.coda.vhdl.doc/html/ --theme=python vhdl-user_manual.tex

##### Making HTMLs (END) #####

##### Clean (BEGIN) #####

clean: component_diagrams-clean vhdl-clean
	rm -rf *.aux *.log *.rel *.paux *.out *.synctex.gz *.toc

clean-all: clean component_diagrams-clean-all vhdl-clean-all
	rm user_manual.pdf

component_diagrams-clean:
	rm -rf component_diagrams/*.aux component_diagrams/*.log component_diagrams/*.rel component_diagrams/*.paux component_diagrams/*.out component_diagrams/*.synctex.gz component_diagrams/*.toc

component_diagrams-clean-all: component_diagrams-clean component_diagrams-remove 
	rm -rf component_diagrams/component_diagrams-user_manual.pdf

vhdl-clean:
	rm -rf vhdl/*.aux vhdl/*.log vhdl/*.rel vhdl/*.paux vhdl/*.out vhdl/*.synctex.gz vhdl/*.toc

vhdl-clean-all: vhdl-clean vhdl-remove 
	rm -rf vhdl/vhdl-user_manual.pdf

##### Clean (END) #####
