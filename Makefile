OUT_DIR=dist
HTMLFILES=$(patsubst %.org,$(OUT_DIR)/%.html,$(wildcard *.org))

.PHONY: all clean dist

all: dist

dist: $(OUT_DIR) $(HTMLFILES)

%.html: %.org
	emacs --batch -l setup.el $< -f org-html-export-to-html --kill

$(OUT_DIR)/%.html: %.html
	mv $< $(OUT_DIR)
	mv *.svg $(OUT_DIR)

clean:
	rm dist/*.html dist/fig-* .ob-jupyter/
