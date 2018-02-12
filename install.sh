#!/bin/bash

COMMODITIES_DIR=.cbm

if [[ !( -d $COMMODITIES_DIR ) ]]
then
	mkdir $COMMODITIES_DIR
fi

# Download Commodities
wget --quiet http://www.theweb.dk/KickAssembler/KickAssembler.zip
unzip -uoqq KickAssembler.zip KickAss.jar -d $COMMODITIES_DIR
rm KickAssembler.zip

# Provide Bash functions to travis-ci environment


# Launch kick assembler
function ka()
{
	java -jar $COMMODITIES_DIR/KickAss.jar "$@"
}

