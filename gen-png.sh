#! /usr/bin/env sh

for i in fig-*.pdf; do convert -density 300 -quality 85 "$i" "dist/${i%%.*}.png"; done
