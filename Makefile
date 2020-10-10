# Modified from https://stackoverflow.com/a/22091045
OUT_DIR=dist
HTMLFILES=$(patsubst %.org,$(OUT_DIR)/%.html,$(wildcard *.org))

.PHONY: all clean dist

all: dist

dist: $(HTMLFILES)

%.html: %.org
	emacs --batch -l setup.el $< -f org-html-export-to-html --kill

clean:
	rm dist/*.html dist/fig-*
