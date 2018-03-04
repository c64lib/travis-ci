#!/bin/bash

COMMODITIES_DIR=.cbm

if [[ !( -d $COMMODITIES_DIR ) ]]
then
	mkdir $COMMODITIES_DIR
fi

# Download Commodities
wget --quiet -P $COMMODITIES_DIR https://github.com/c64lib/asm-ka/releases/download/4.19/KickAss.jar

# Provide Bash functions to travis-ci environment


# Launch kick assembler
function ka()
{
	java -jar $COMMODITIES_DIR/KickAss.jar "$@"
}

