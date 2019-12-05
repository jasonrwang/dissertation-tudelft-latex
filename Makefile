
.PHONY: force-build

all: 0_dissertation.pdf

force-build:

0_dissertation.pdf: force-build
	xelatex 0_dissertation
	bibtex 04_chapter-1/chapter-1
	bibtex 0_dissertation
	xelatex 0_dissertation
	xelatex 0_dissertation

propositions.pdf: force-build
	xelatex propositions
	xelatex propositions
