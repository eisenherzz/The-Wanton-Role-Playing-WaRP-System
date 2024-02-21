## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard WaRP*.$(MEXT))


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

%.pdf:	%.md
	pandoc -V geometry:margin=2cm -o $@ $<
	
%.html:	%.md
	pandoc -o $@ $<

%.tex:	%.md
	pandoc -o $@ $<
	
%.epub:	%.md
	pandoc -o $@ $<

%.odt:	%.md
	pandoc -o $@ $<

clean:
	rm -f *.pdf *.html *.tex *.epub *.odt
 
