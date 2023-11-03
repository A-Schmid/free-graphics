#!/bin/bash

mkdir tmp

COUNTER=0

# iterate all svg files in all subdirectories
for file in $(find . -iname '*.svg');
do
    # use inkscape to convert svg to png and store results in temporary directory
    inkscape -w 256 $file -o "tmp/$COUNTER.png"
    COUNTER=$((COUNTER+1))
done;

# use imagemagick to create a montage of all images in the repository
montage "tmp/*.png" -tile "5x$(((COUNTER/5)+1))" preview.png

rm -r tmp
