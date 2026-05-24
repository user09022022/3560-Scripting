#!/bin/bash
filename=cyberlog7.txt
if [ -f $filename ]
then
	echo "Exist"
	failed_log=$(grep -E -c 'ssh.*: Failed password' $filename) 
	echo "Total failed logins: $failed_log"
else
	echo "Does not exist"
fi
