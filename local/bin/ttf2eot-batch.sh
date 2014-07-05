#!/bin/bash
# Batch convert all TTF files in a directory to EOT
# bohoomil <bohoomil[at]gmail.com>

for f in *.ttf; do
  ttf2eot $f > `basename -s .ttf $f`.eot
done

