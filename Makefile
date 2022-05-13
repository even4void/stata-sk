OUT_DIR=dist
HTMLFILES=$(patsubst %.org,$(OUT_DIR)/%.html,$(wildcard *.org))

.PHONY: all clean veryclean dist

all: dist

dist: $(OUT_DIR) $(HTMLFILES)

%.html: %.org
	emacs --batch -l setup.el $< -f org-html-export-to-html --kill
	./gen-png.sh
	mv *.eps $(OUT_DIR)

$(OUT_DIR)/%.html: %.html
	mv $< $(OUT_DIR)

clean:
	rm -rf bib2html* *.bbl *.synctex.gz *-blx.bib main.tex references.html

veryclean:
	rm dist/*.html dist/fig-*.svg dist/fig-*.eps .ob-jupyter/* bib2html*
