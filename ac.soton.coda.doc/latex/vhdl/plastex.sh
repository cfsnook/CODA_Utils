#!/bin/sh
BASENAME="vhdl-user_manual"
TEXFile="$BASENAME.tex"
ROOT_FOLDER="../../../.."
HTML_FOLDER="$ROOT_FOLDER/code/ac.soton.coda.vhdl.doc/html"

echo "plastex -d $HTML_FOLDER --theme=python $TEXFile"
plastex -d $HTML_FOLDER --theme=python $TEXFile

echo "sed -f sed_commands -i '' $HTML_FOLDER/eclipse-toc.xml"
sed -f sed_commands -i '' $HTML_FOLDER/eclipse-toc.xml
