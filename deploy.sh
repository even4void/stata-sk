#!/usr/bin/env bash
#
# Replace `gcp' with `cp' for true Un*x systems.
# 
git log --format='* %h (%cD, %an) %s' | cat > history.txt

gcp -u history.txt [0-9]*.{org,html} worg.css references.html stata-logo.png fig-*.png ~/Sites/aliquote/content/static/articles/stata/
