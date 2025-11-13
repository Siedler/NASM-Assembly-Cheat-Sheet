PANDOC=pandoc

all: Cheat-Sheet.html index.html #Cheat-Sheet.pdf

Cheat-Sheet.html: Cheat-Sheet.md styles/style.css
	$(PANDOC) -f gfm -t html --mathjax=https://cdn.jsdelivr.net/npm/mathjax@4/tex-mml-chtml.js --css styles/style.css --standalone -o $@ $<

Cheat-Sheet.pdf: Cheat-Sheet.md
	$(PANDOC) -f markdown -t pdf -o $@ $<

index.html: Cheat-Sheet.html
	cp $< $@

.SUFFIXES:
.SUFFIXES: .html .pdf .md
.PHONY: all
.POSIX:
