#!/bin/bash
#1
grep -E -n '^[0-9]*\.[0-9]*$' floatlog01.txt 
#2
grep -E -n '(^[0-9]{2,}) ?.*=.*?\1$' backref01.txt 
#3
grep -E -n '^[0-9]{1,}.*[0-9]{1,}$' digitline01.txt  
grep -E -n '^[0-9]+.*[0-9]$' digitline01.txt
#4
grep -E -n '\b10\.0\.0\.(25|134)\b' ipgroup01.txt 
#5
grep -E -n '(0x90 ?){4,}' hexrepeat01.txt
