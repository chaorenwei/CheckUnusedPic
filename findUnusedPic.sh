#! /bin/bash

echo "" > UnusedPic.txt
for i in `find . -name "*.png" -o -name "*.jpg"`; do
    file=`basename -s .jpg "$i" | xargs basename -s .png | xargs basename -s @2x | xargs basename -s @3x`
    result=`ack -i "$file"`
    if [ -z "$result" ]; then
        echo "$i" >> UnusedPic.txt 
    fi
done