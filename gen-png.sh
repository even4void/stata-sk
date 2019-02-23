#! /usr/bin/env sh

for i in fig-*.eps; do convert -density 300 -quality 85 "$i" "dist/${i%%.*}.png"; done
