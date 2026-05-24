#!/bin/bash

# ==========================================
# CSIS 3560 - Regex Practice Tasks
# Student: gal02
# File: regexpractice_gal02.sh
# Course Focus:
# - grep
# - grep -E
# - regex
# - cybersecurity log analysis
# ==========================================

echo "=========================================="
echo "Task 1 - Match Failed SSH Logins"
echo "Target: Find ONLY failed SSH password attempts"
echo "=========================================="

grep -E -n 'Failed password' cyberlog1.txt

echo
echo "=========================================="
echo "Task 2 - Match Failed SSH Logins from 192.168.x.x"
echo "Target: Find ONLY failed SSH attempts from internal network"
echo "=========================================="

grep -E -n 'ssh.*Failed password.*192\.168\.' cyberlog2.txt

echo
echo "=========================================="
echo "Task 3 - Match Accepted Password Logins"
echo "Target: Find ONLY accepted SSH password logins"
echo "=========================================="

grep -E -n 'Accepted password' cyberlog2.txt

echo
echo "=========================================="
echo "Task 4 - Match Lines Starting with May"
echo "Target: Match ONLY lines beginning with May"
echo "=========================================="

grep -E -n '^May' cyberlog2.txt

echo
echo "=========================================="
echo "Task 5 - Match Lines Ending with ssh2"
echo "Target: Match ONLY SSH authentication lines"
echo "=========================================="

grep -E -n 'ssh2$' cyberlog2.txt

echo
echo "=========================================="
echo "Task 6 - Match root OR admin"
echo "Target: Match usernames root OR admin"
echo "=========================================="

grep -E -n '(root|admin)' cyberlog2.txt

echo
echo "=========================================="
echo "Task 7 - Match ONLY IP Addresses from 10.x.x.x"
echo "Target: Find suspicious external/internal ranges starting with 10."
echo "=========================================="

grep -E -n '10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' cyberlog2.txt

echo
echo "=========================================="
echo "Task 8 - Match nginx Service Logs"
echo "Target: Match ONLY nginx service entries"
echo "=========================================="

grep -E -n 'nginx' cyberlog2.txt

echo
echo "=========================================="
echo "Task 9 - Match sudo Activity"
echo "Target: Match ONLY sudo command activity"
echo "=========================================="

grep -E -n 'sudo:' cyberlog2.txt

echo
echo "=========================================="
echo "Task 10 - Match Failed OR Accepted Password Events"
echo "Target: Match authentication success and failure events"
echo "=========================================="

grep -E -n '(Failed|Accepted) password' cyberlog2.txt
