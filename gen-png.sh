#! /usr/bin/env sh

# for i in fig-*.eps; do convert -density 300 -quality 85 "$i" "dist/${i%%.*}.png"; done
for i in fig-*.svg; do convert -density 1200 "$i" "${i%%.*}.png"; done
