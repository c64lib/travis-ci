#!/bin/bash

COMMODITIES_DIR=.cbm
CBM_MODULES_DIR=cbm_modules

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

function cpm()
{
	if [[ !( -d $CBM_MODULES_DIR ) ]]
	then
		mkdir $CBM_MODULES_DIR
	fi
	
	echo "Installing $1..."
	wget -qO - $1 | tar xvz -C $CBM_MODULES_DIR
}
