## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))


PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)
EPUB=$(SRC:.md=.epub)
ODT=$(SRC:.md=.odt)


all:	$(PDF) $(HTML) $(TEX) $(EPUB) $(ODT)

pdf:	clean $(PDF)
html:	clean $(HTML)
tex:	clean $(TEX)
epub:	clean $(EPUB)
odt:	clean $(ODT)

%.html:	%.md
	pandoc -S -o $@ $<

%.tex:	%.md
	pandoc -S -o $@ $<
	
%.epub:	%.md
	pandoc -S -o $@ $<

%.odt:	%.md
	pandoc -S -o $@ $<

%.pdf:	%.md
	pandoc -V geometry:margin=2cm -S -o $@ $<

clean:
	rm -f *.html *.pdf *.tex *.epub *.odt
 
