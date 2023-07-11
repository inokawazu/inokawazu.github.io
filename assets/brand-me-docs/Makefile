.PHONY: all clean

SOURCEDIR=src
BUILDDIR=build
DATADIR=data
TEX=latexmk -pdf --output-directory=$(BUILDDIR)

DATA=$(wildcard $(DATADIR)/*)

all: cv.pdf publications.pdf

clean:
	rm $(BUILDDIR)/*

cv.pdf: $(SOURCEDIR)/cv.tex $(DATA)
	@$(TEX) $<

publications.pdf: $(SOURCEDIR)/publications.tex $(DATA)
	@$(TEX) $<
