OUT_DIR=dist
HTMLFILES=$(patsubst %.org,$(OUT_DIR)/%.html,$(wildcard *.org))

.PHONY: all clean veryclean dist

all: dist

dist: $(OUT_DIR) $(HTMLFILES)

%.html: %.org
	emacs --batch -l setup.el $< -f org-html-export-to-html --kill

$(OUT_DIR)/%.html: %.html
	mv $< $(OUT_DIR)
	mv *.svg $(OUT_DIR)

clean:
	rm -rf .ob-jupyter/ bib2html* references.html

veryclean:
	rm dist/*.html dist/fig-*.svg .ob-jupyter/* bib2html*
