# Modified from https://stackoverflow.com/a/22091045
OUT_DIR=dist
HTMLFILES=$(patsubst %.org,$(OUT_DIR)/%.html,$(wildcard *.org))

.PHONY: all clean veryclean dist

all: dist

dist: $(OUT_DIR) $(HTMLFILES)

$(OUT_DIR):
	mkdir -v -p $(OUT_DIR)

%.html: %.org
	emacs --batch -l setup.el $< -f org-html-export-to-html --kill

$(OUT_DIR)/%.html: %.html
	./gen-png.sh
	mv $< $(OUT_DIR)

clean:
	rm fig-*.eps

veryclean:
	rm dist/*.html dist/fig-*.png
