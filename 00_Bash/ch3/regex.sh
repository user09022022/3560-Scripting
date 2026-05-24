#!/bin/bash

# =========================================================
# CSIS 3560 - Chapter 3 Regex & grep Reference
# Cybersecurity Ops with Bash
# Topics:
# - grep
# - grep -E
# - regex
# - anchors
# - grouping
# - alternation
# - quantifiers
# - character classes
# - cybersecurity log analysis
# =========================================================


echo "================================================="
echo "[ 1 ] grep"
echo "================================================="
echo "Purpose:"
echo "- Search text in files"
echo "- Basic filtering"
echo
echo "Common Uses:"
echo "- search logs"
echo "- search usernames"
echo "- search services"
echo

grep "root" cyberlog.txt

echo
echo "Useful Options:"
echo "-i   ignore case"
echo "-n   show line numbers"
echo "-c   count matches"
echo "-v   invert match"
echo "-r   recursive search"


echo
echo "================================================="
echo "[ 2 ] grep -E"
echo "================================================="
echo "Purpose:"
echo "- Extended regex"
echo "- Required for advanced regex"
echo
echo "Common Uses:"
echo "- grouping"
echo "- alternation"
echo "- quantifiers"
echo

grep -E '(root|admin)' cyberlog.txt


echo
echo "================================================="
echo "[ 3 ] . (dot)"
echo "================================================="
echo "Purpose:"
echo "- Match ANY single character"
echo
echo "Common Uses:"
echo "- unknown characters"
echo "- flexible matching"
echo

grep -E 'r..t' cyberlog.txt

echo
echo "Matches examples:"
echo "root"
echo "r00t"


echo
echo "================================================="
echo "[ 4 ] * (zero or more)"
echo "================================================="
echo "Purpose:"
echo "- Repeat previous character 0 or more times"
echo

grep -E 'go*gle' regexlog.txt

echo
echo "Matches:"
echo "ggle"
echo "gogle"
echo "google"


echo
echo "================================================="
echo "[ 5 ] + (one or more)"
echo "================================================="
echo "Purpose:"
echo "- Repeat previous character 1 or more times"
echo

grep -E 'go+gle' regexlog.txt

echo
echo "Matches:"
echo "google"
echo "gooogle"

echo
echo "Non-match:"
echo "ggle"


echo
echo "================================================="
echo "[ 6 ] ? (optional)"
echo "================================================="
echo "Purpose:"
echo "- Previous character optional"
echo

grep -E 'colou?r' regexlog.txt

echo
echo "Matches:"
echo "color"
echo "colour"


echo
echo "================================================="
echo "[ 7 ] ^ (start anchor)"
echo "================================================="
echo "Purpose:"
echo "- Match beginning of line"
echo
echo "Common Uses:"
echo "- logs beginning with May"
echo "- IP beginning with 192"
echo

grep -E '^May' cyberlog.txt


echo
echo "================================================="
echo "[ 8 ] $ (end anchor)"
echo "================================================="
echo "Purpose:"
echo "- Match end of line"
echo
echo "Common Uses:"
echo "- lines ending with failed"
echo "- filenames ending .sh"
echo

grep -E 'failed$' cyberlog.txt


echo
echo "================================================="
echo "[ 9 ] [ ] character classes"
echo "================================================="
echo "Purpose:"
echo "- Match one character from set/range"
echo

grep -E '[0-9]' cyberlog.txt

echo
echo "Ranges:"
echo "[0-9]    digits"
echo "[a-z]    lowercase"
echo "[A-Z]    uppercase"
echo "[a-zA-Z] letters"


echo
echo "================================================="
echo "[ 10 ] [^ ] negation"
echo "================================================="
echo "Purpose:"
echo "- Match anything EXCEPT set"
echo

grep -E '[^0-9]' cyberlog.txt


echo
echo "================================================="
echo "[ 11 ] ( ) grouping"
echo "================================================="
echo "Purpose:"
echo "- Group expressions together"
echo
echo "Common Uses:"
echo "- alternation"
echo "- repeated patterns"
echo

grep -E '(root|admin)' cyberlog.txt


echo
echo "================================================="
echo "[ 12 ] | alternation"
echo "================================================="
echo "Purpose:"
echo "- Logical OR"
echo

grep -E 'ssh|sudo|nginx' cyberlog.txt


echo
echo "================================================="
echo "[ 13 ] { } quantifiers"
echo "================================================="
echo "Purpose:"
echo "- Exact or ranged repetition"
echo

grep -E '[0-9]{3}' cyberlog.txt

echo
echo "Quantifier Examples:"
echo "{3}     exactly 3"
echo "{2,5}   between 2 and 5"
echo "{4,}    4 or more"


echo
echo "================================================="
echo "[ 14 ] IP Address Matching"
echo "================================================="
echo "Purpose:"
echo "- Match IPv4 addresses"
echo
echo "Common Uses:"
echo "- suspicious IPs"
echo "- internal network detection"
echo

grep -E '192\.168\.[0-9]{1,3}\.[0-9]{1,3}' cyberlog.txt


echo
echo "================================================="
echo "[ 15 ] Hexadecimal Matching"
echo "================================================="
echo "Purpose:"
echo "- Match hexadecimal values"
echo
echo "Common Uses:"
echo "- shellcode"
echo "- memory addresses"
echo "- malware analysis"
echo

grep -E '0x[0-9a-fA-F]+' cyberlog.txt


echo
echo "================================================="
echo "[ 16 ] Repeated Patterns"
echo "================================================="
echo "Purpose:"
echo "- Detect repeated sequences"
echo

grep -E '(0x90 ){3,}' cyberlog.txt


echo
echo "================================================="
echo "[ 17 ] grep -i"
echo "================================================="
echo "Purpose:"
echo "- Ignore uppercase/lowercase"
echo

grep -i 'root' cyberlog.txt


echo
echo "================================================="
echo "[ 18 ] grep -n"
echo "================================================="
echo "Purpose:"
echo "- Show line numbers"
echo

grep -n 'Failed' cyberlog.txt


echo
echo "================================================="
echo "[ 19 ] grep -c"
echo "================================================="
echo "Purpose:"
echo "- Count matches"
echo

grep -c 'Failed password' cyberlog.txt


echo
echo "================================================="
echo "[ 20 ] grep -v"
echo "================================================="
echo "Purpose:"
echo "- Invert match"
echo "- Show non-matching lines"
echo

grep -v 'Accepted' cyberlog.txt


echo
echo "================================================="
echo "[ 21 ] grep + pipeline"
echo "================================================="
echo "Purpose:"
echo "- Combine filtering commands"
echo
echo "Common Uses:"
echo "- SOC analysis"
echo "- log investigation"
echo

cat cyberlog.txt | grep "Failed"


echo
echo "================================================="
echo "[ 22 ] grep + sort + uniq"
echo "================================================="
echo "Purpose:"
echo "- Count repeated values"
echo

cat cyberlog.txt | grep "Failed" | sort | uniq


echo
echo "================================================="
echo "[ 23 ] grep + tee"
echo "================================================="
echo "Purpose:"
echo "- Save and display output"
echo

grep "Failed" cyberlog.txt | tee failedlogins.txt


echo
echo "================================================="
echo "[ 24 ] Common Cybersecurity Patterns"
echo "================================================="

echo "Failed SSH logins:"
echo 'grep -E "Failed password" auth.log'

echo
echo "Accepted SSH logins:"
echo 'grep -E "Accepted password" auth.log'

echo
echo "Suspicious executable downloads:"
echo 'grep -E "http.*\.exe$" cyberlog.txt'

echo
echo "Internal network:"
echo 'grep -E "^192\.168\." cyberlog.txt'

echo
echo "Repeated shellcode:"
echo 'grep -E "(0x90 ){4,}" cyberlog.txt'


echo
echo "================================================="
echo "[ 25 ] Common Regex Mistakes"
echo "================================================="

echo "Using .* too broadly"
echo "Forgetting anchors ^ and $"
echo "Forgetting to escape dots"
echo "Using grep instead grep -E"
echo "Matching too much"
echo "Matching too little"


echo
echo "================================================="
echo "[ 26 ] Important Notes"
echo "================================================="

echo "grep:"
echo "- basic filtering"

echo
echo "grep -E:"
echo "- advanced regex"

echo
echo "^ and $:"
echo "- anchors"

echo
echo ".:"
echo "- any character"

echo
echo "[ ]:"
echo "- character ranges"

echo
echo "( ):"
echo "- grouping"

echo
echo "|:"
echo "- OR condition"

echo
echo "{ }:"
echo "- repetition control"


echo
echo "================================================="
echo "[ 27 ] Common Chapter 3 Workflow"
echo "================================================="

echo "grep -> filter logs"
echo "sort -> organize"
echo "uniq -> count duplicates"
echo "tee -> save evidence"
echo "wc -> count results"


echo
echo "================================================="
echo "[ 28 ] Example Investigation"
echo "================================================="

grep -E -n 'Failed password for (root|admin)' cyberlog.txt \
| tee suspicious_attempts.txt

echo
echo "Saved suspicious attempts"


echo
echo "================================================="
echo "[ 29 ] END"
echo "================================================="
