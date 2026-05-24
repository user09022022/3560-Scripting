#!/bin/bash

# =========================================================
# CSIS 3560 - Bash Loops Reference
# Chapter 2 Practice Notes
# Based on:
# - Cybersecurity Ops with Bash
# - Lecture 1 and 2
# =========================================================

# Topics:
# - for loops
# - while loops
# - until loops
# - break / continue
# - reading files
# - infinite loops
# - cybersecurity examples

# =========================================================
# [ 1 ] for LOOP
# =========================================================

echo "================================================="
echo "[ 1 ] for LOOP"
echo "================================================="
echo "Purpose:"
echo "- Repeat commands multiple times"
echo "- Iterate over lists"
echo "- Process files/users/IPs"
echo
echo "Common Uses:"
echo "- scan multiple IPs"
echo "- analyze usernames"
echo "- process log entries"
echo "- automate commands"
echo

# basic list iteration
for USER in root admin guest test
do
    echo "Checking user: $USER"
done

echo
echo "Numeric for loop"

# numeric iteration
for (( i=1; i<=5; i++ ))
do
    echo "Counter: $i"
done

echo
echo "Loop through files"

for FILE in *.txt
do
    echo "File found: $FILE"
done


# =========================================================
# [ 2 ] while LOOP
# =========================================================

echo
echo "================================================="
echo "[ 2 ] while LOOP"
echo "================================================="
echo "Purpose:"
echo "- Repeat while condition is TRUE"
echo "- Very common for counters and monitoring"
echo
echo "Common Uses:"
echo "- monitoring scripts"
echo "- retry connections"
echo "- reading files"
echo "- service monitoring"
echo

COUNT=1

while [ "$COUNT" -le 5 ]
do
    echo "Count = $COUNT"
    (( COUNT++ ))
done

echo
echo "Cybersecurity example"

FAILED=0

while (( FAILED < 3 ))
do
    echo "Monitoring failed login attempts..."
    (( FAILED++ ))
done


# =========================================================
# [ 3 ] until LOOP
# =========================================================

echo
echo "================================================="
echo "[ 3 ] until LOOP"
echo "================================================="
echo "Purpose:"
echo "- Repeat UNTIL condition becomes TRUE"
echo "- Opposite of while"
echo
echo "Common Uses:"
echo "- retry until success"
echo "- wait for server/service"
echo

NUMBER=1

until [ "$NUMBER" -gt 5 ]
do
    echo "Number = $NUMBER"
    (( NUMBER++ ))
done


# =========================================================
# [ 4 ] Reading a File with while
# =========================================================

echo
echo "================================================="
echo "[ 4 ] Reading a File"
echo "================================================="
echo "Purpose:"
echo "- Read files line by line"
echo "- Extremely important in cybersecurity"
echo
echo "Common Uses:"
echo "- parse logs"
echo "- analyze auth.log"
echo "- process IP lists"
echo "- read usernames/passwords"
echo

# example:
# cyberlog.txt required

while IFS= read -r LINE
do
    echo "Log entry: $LINE"
done < cyberlog.txt


# =========================================================
# [ 5 ] break
# =========================================================

echo
echo "================================================="
echo "[ 5 ] break"
echo "================================================="
echo "Purpose:"
echo "- Stop loop immediately"
echo
echo "Common Uses:"
echo "- stop after detection"
echo "- stop after suspicious activity"
echo

for IP in 192.168.1.10 192.168.1.20 10.0.0.5
do

    echo "Checking IP: $IP"

    if [[ "$IP" =~ ^10\. ]]
    then
        echo "Suspicious network detected"
        break
    fi

done


# =========================================================
# [ 6 ] continue
# =========================================================

echo
echo "================================================="
echo "[ 6 ] continue"
echo "================================================="
echo "Purpose:"
echo "- Skip current iteration"
echo "- Continue with next loop cycle"
echo
echo "Common Uses:"
echo "- skip clean entries"
echo "- ignore comments"
echo "- ignore safe IPs"
echo

for USER in root guest admin backup
do

    # skip guest
    if [ "$USER" = "guest" ]
    then
        continue
    fi

    echo "Analyzing user: $USER"

done


# =========================================================
# [ 7 ] Infinite while LOOP
# =========================================================

echo
echo "================================================="
echo "[ 7 ] Infinite while LOOP"
echo "================================================="
echo "Purpose:"
echo "- Continuous monitoring"
echo "- Background services"
echo
echo "Common Uses:"
echo "- log monitoring"
echo "- service monitoring"
echo "- SOC scripts"
echo

# WARNING:
# commented to avoid infinite execution

# while true
# do
#     echo "Monitoring..."
#     sleep 5
# done


# =========================================================
# [ 8 ] Loop + grep
# =========================================================

echo
echo "================================================="
echo "[ 8 ] Loop + grep"
echo "================================================="
echo "Purpose:"
echo "- Combine loops with filtering"
echo
echo "Common Uses:"
echo "- detect attacks"
echo "- analyze logs"
echo "- search indicators"
echo

for WORD in root admin malware
do

    echo "Searching for: $WORD"

    grep -i "$WORD" cyberlog.txt

done


# =========================================================
# [ 9 ] Loop through IP list
# =========================================================

echo
echo "================================================="
echo "[ 9 ] Loop Through IPs"
echo "================================================="
echo "Purpose:"
echo "- Automate multiple hosts"
echo
echo "Common Uses:"
echo "- ping sweep"
echo "- vulnerability scanning"
echo "- automation"
echo

for IP in 192.168.1.1 192.168.1.10 8.8.8.8
do

    ping -c 1 "$IP" &> /dev/null

    if [ $? -eq 0 ]
    then
        echo "$IP is reachable"
    else
        echo "$IP is unreachable"
    fi

done


# =========================================================
# [ 10 ] Nested LOOP
# =========================================================

echo
echo "================================================="
echo "[ 10 ] Nested LOOP"
echo "================================================="
echo "Purpose:"
echo "- Loop inside another loop"
echo
echo "Common Uses:"
echo "- user/service combinations"
echo "- brute force simulations"
echo "- matrix processing"
echo

for USER in admin root
do

    for SERVICE in ssh nginx
    do
        echo "$USER -> $SERVICE"
    done

done


# =========================================================
# [ 11 ] Common LOOP Patterns
# =========================================================

echo
echo "================================================="
echo "[ 11 ] Common LOOP Patterns"
echo "================================================="

echo "for ITEM in list"
echo "while condition"
echo "until condition"
echo "break"
echo "continue"
echo "while read LINE"
echo "for (( i=0; i<5; i++ ))"


# =========================================================
# [ 12 ] Common Cybersecurity Uses
# =========================================================

echo
echo "================================================="
echo "[ 12 ] Common Cybersecurity Uses"
echo "================================================="

echo "- monitor failed logins"
echo "- process malware hashes"
echo "- scan networks"
echo "- parse auth.log"
echo "- automate grep searches"
echo "- monitor services"
echo "- automate incident response"
echo "- process IOC lists"


# =========================================================
# [ 13 ] Important Notes
# =========================================================

echo
echo "================================================="
echo "[ 13 ] Important Notes"
echo "================================================="

echo "for loops:"
echo "- best for lists and counters"

echo
echo "while loops:"
echo "- best for conditions and monitoring"

echo
echo "until loops:"
echo "- opposite of while"

echo
echo "break:"
echo "- exits loop immediately"

echo
echo "continue:"
echo "- skips current iteration"


# =========================================================
# END
# =========================================================
