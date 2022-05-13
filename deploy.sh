#! /usr/bin/env bash

git log --format='* %h (%cD, %an) %s' | cat >history.txt

cp -r -u history.txt dist/* ~/Sites/aliquote/static/articles/stata-sk/
rm ~/Sites/aliquote/static/articles/stata-sk/fig-*.eps
