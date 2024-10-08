#!/bin/bash

# Declare variables
OUTPUT_FILE=numbers.tex
FILELIST=$(find . -type f -name "*.txt")

# Run code
rm $OUTPUT_FILE 2>/dev/null
touch $OUTPUT_FILE

for file in $FILELIST
do
    content=$(<$file)
    filename=$(basename $file .txt)
    latexcommand=$(echo $filename | sed 's/_\(.\)/\U\1/g')
    outstring="\newcommand{\\"$latexcommand"}{"$content"}"
    echo $outstring >> $OUTPUT_FILE
done