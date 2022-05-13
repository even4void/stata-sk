#! /usr/bin/env bash

# Note: Replace `gcp' and `gsed' with `cp' and `sed' for true Un*x systems.

git log --format='* %h (%cD, %an) %s' | cat >history.txt

if [ "$(uname)" == "Darwin" ]; then
	gsed -i s+/Users/chl/org/drafts/_assets/++ dist/*.html
	gcp -u history.txt dist/* ~/Sites/aliquote/static/articles/stata-sk/
elif [ "$(uname -s)" == "Linux" ]; then
	cp -u history.txt dist/* ~/Sites/aliquote/static/articles/stata-sk/
fi
