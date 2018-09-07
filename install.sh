#!/bin/bash

COMMODITIES_DIR=.cbm
CPM_MODULES_DIR=cpm_modules

if [[ !( -d $COMMODITIES_DIR ) ]]
then
	mkdir $COMMODITIES_DIR
fi

# Download Kickassembler
wget --quiet -P $COMMODITIES_DIR https://github.com/c64lib/asm-ka/releases/download/4.19/KickAss.jar

# Provide Bash functions to travis-ci environment


# Launch kick assembler
function ka()
{
	java -jar $COMMODITIES_DIR/KickAss.jar "$@"
}

# build all asm sources in given directory
function kall()
{
	for f in $1/*.asm
	do 
		ka -libdir $CPM_MODULES_DIR $f
	done
}

# CBM Package Manager ;-)
function cpm()
{
	if [[ !( -d $CPM_MODULES_DIR ) ]]
	then
		mkdir $CPM_MODULES_DIR
	fi
	mkdir $CPM_MODULES_DIR/$1
	
	echo "Installing $1 from $2..."
	wget -qO - $2 | tar xvz -C $CPM_MODULES_DIR/$1 --strip-components=1
}
