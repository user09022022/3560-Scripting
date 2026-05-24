#!/bin/bash
#conditionals
##1-if command
if grep "clear" log.txt &> /dev/null
then
	echo "Found it"
else
	echo "Not found it"
fi

if [ -f log.txt ] &> /dev/null
then
	echo "log1.txt Exist"
else
	echo "Does not exist"
fi

if cd workshop2 &> /dev/null
then
	echo "dir exist"
else
	echo "dir does not exist"
fi
###2 classic test []
##strings, file checks, numeric comparissons
USER=$(whoami)
if [ "$USER" = "gal02" ]
then
	echo "Admin user"
fi
#file check
if [ -f log1.txt ] &> /dev/null 
then
	echo "File exist"
fi



