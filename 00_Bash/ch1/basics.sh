#!/bin/bash

# =========================================================
# CSIS 3560 - Chapter 1 Linux Basics Reference
# Cybersecurity Ops with Bash
# Topics:
# - navigation
# - files/directories
# - permissions
# - help commands
# - history
# - redirection
# - cybersecurity basics
# =========================================================


echo "================================================="
echo "[ 1 ] pwd"
echo "================================================="
echo "Purpose:"
echo "- Print current directory"
echo
echo "Common Uses:"
echo "- know current location"
echo "- scripting"
echo "- troubleshooting"
echo

pwd


echo
echo "================================================="
echo "[ 2 ] whoami"
echo "================================================="
echo "Purpose:"
echo "- Show current logged user"
echo
echo "Common Uses:"
echo "- privilege checks"
echo "- sudo verification"
echo

whoami


echo
echo "================================================="
echo "[ 3 ] id"
echo "================================================="
echo "Purpose:"
echo "- Show user and group IDs"
echo
echo "Common Uses:"
echo "- permission troubleshooting"
echo "- security auditing"
echo

id


echo
echo "================================================="
echo "[ 4 ] ls"
echo "================================================="
echo "Purpose:"
echo "- List files/directories"
echo
echo "Common Uses:"
echo "- inspect folders"
echo "- check permissions"
echo "- hidden files"
echo

ls

echo
echo "Useful Options:"
echo "-l   long listing"
echo "-a   hidden files"
echo "-h   human readable"
echo "-la  combined"

ls -la


echo
echo "================================================="
echo "[ 5 ] cd"
echo "================================================="
echo "Purpose:"
echo "- Change directory"
echo

cd /tmp
pwd

cd ~
pwd


echo
echo "================================================="
echo "[ 6 ] mkdir"
echo "================================================="
echo "Purpose:"
echo "- Create directories"
echo
echo "Common Uses:"
echo "- lab folders"
echo "- evidence folders"
echo

mkdir testfolder


echo
echo "================================================="
echo "[ 7 ] touch"
echo "================================================="
echo "Purpose:"
echo "- Create empty files"
echo
echo "Common Uses:"
echo "- logs"
echo "- scripts"
echo "- test files"
echo

touch cyberlog.txt


echo
echo "================================================="
echo "[ 8 ] cp"
echo "================================================="
echo "Purpose:"
echo "- Copy files/directories"
echo
echo "Common Uses:"
echo "- backups"
echo "- evidence copies"
echo

cp cyberlog.txt backuplog.txt


echo
echo "================================================="
echo "[ 9 ] mv"
echo "================================================="
echo "Purpose:"
echo "- Move or rename files"
echo

mv backuplog.txt oldlog.txt


echo
echo "================================================="
echo "[ 10 ] rm"
echo "================================================="
echo "Purpose:"
echo "- Remove files/directories"
echo
echo "WARNING:"
echo "- be careful with rm -rf"
echo

rm oldlog.txt


echo
echo "================================================="
echo "[ 11 ] file"
echo "================================================="
echo "Purpose:"
echo "- Detect file type"
echo
echo "Common Uses:"
echo "- malware analysis"
echo "- unknown files"
echo

file cyberlog.txt


echo
echo "================================================="
echo "[ 12 ] cat"
echo "================================================="
echo "Purpose:"
echo "- Display file content"
echo

cat cyberlog.txt


echo
echo "================================================="
echo "[ 13 ] more / less"
echo "================================================="
echo "Purpose:"
echo "- Read large files"
echo
echo "Common Uses:"
echo "- auth.log"
echo "- large evidence files"
echo

more cyberlog.txt

# less cyberlog.txt


echo
echo "================================================="
echo "[ 14 ] head"
echo "================================================="
echo "Purpose:"
echo "- Show beginning of file"
echo

head cyberlog.txt

echo
echo "Useful Option:"
echo "-n  specify number of lines"

head -n 5 cyberlog.txt


echo
echo "================================================="
echo "[ 15 ] tail"
echo "================================================="
echo "Purpose:"
echo "- Show end of file"
echo
echo "Common Uses:"
echo "- log monitoring"
echo

tail cyberlog.txt

echo
echo "Useful Option:"
echo "-f  live monitoring"

# tail -f cyberlog.txt


echo
echo "================================================="
echo "[ 16 ] history"
echo "================================================="
echo "Purpose:"
echo "- Show command history"
echo
echo "Common Uses:"
echo "- logging"
echo "- auditing"
echo "- troubleshooting"
echo

history

echo
echo "Timestamp Example:"
echo 'export HISTTIMEFORMAT="%F %T "'


echo
echo "================================================="
echo "[ 17 ] type"
echo "================================================="
echo "Purpose:"
echo "- Identify command type"
echo
echo "Common Uses:"
echo "- alias detection"
echo "- command troubleshooting"
echo

type ls


echo
echo "================================================="
echo "[ 18 ] which"
echo "================================================="
echo "Purpose:"
echo "- Show command path"
echo

which bash


echo
echo "================================================="
echo "[ 19 ] alias"
echo "================================================="
echo "Purpose:"
echo "- Create command shortcuts"
echo

alias ll='ls -la'

alias


echo
echo "================================================="
echo "[ 20 ] find"
echo "================================================="
echo "Purpose:"
echo "- Search files/directories"
echo
echo "Common Uses:"
echo "- locate evidence"
echo "- locate malware"
echo "- locate scripts"
echo

find . -name "*.txt"


echo
echo "================================================="
echo "[ 21 ] locate"
echo "================================================="
echo "Purpose:"
echo "- Fast file search"
echo

locate passwd


echo
echo "================================================="
echo "[ 22 ] ln"
echo "================================================="
echo "Purpose:"
echo "- Create symbolic links"
echo

ln -s cyberlog.txt linklog.txt


echo
echo "================================================="
echo "[ 23 ] chmod"
echo "================================================="
echo "Purpose:"
echo "- Change permissions"
echo
echo "Common Uses:"
echo "- executable scripts"
echo "- permission hardening"
echo

chmod +x myscript.sh

echo
echo "Numeric Permissions:"
echo "755 = rwxr-xr-x"
echo "644 = rw-r--r--"


echo
echo "================================================="
echo "[ 24 ] chown"
echo "================================================="
echo "Purpose:"
echo "- Change file owner"
echo

# sudo chown root cyberlog.txt


echo
echo "================================================="
echo "[ 25 ] chgrp"
echo "================================================="
echo "Purpose:"
echo "- Change group owner"
echo

# sudo chgrp sudo cyberlog.txt


echo
echo "================================================="
echo "[ 26 ] umask"
echo "================================================="
echo "Purpose:"
echo "- Default file permissions"
echo

umask


echo
echo "================================================="
echo "[ 27 ] sudo"
echo "================================================="
echo "Purpose:"
echo "- Execute as administrator"
echo
echo "Common Uses:"
echo "- install packages"
echo "- manage services"
echo "- security tasks"
echo

# sudo apt update


echo
echo "================================================="
echo "[ 28 ] su"
echo "================================================="
echo "Purpose:"
echo "- Switch user"
echo

# su
# su -


echo
echo "================================================="
echo "[ 29 ] Redirection >"
echo "================================================="
echo "Purpose:"
echo "- Redirect output to file"
echo

echo "test log" > output.txt


echo
echo "================================================="
echo "[ 30 ] Append >>"
echo "================================================="
echo "Purpose:"
echo "- Append output"
echo

echo "new line" >> output.txt


echo
echo "================================================="
echo "[ 31 ] Error Redirection 2>"
echo "================================================="
echo "Purpose:"
echo "- Redirect errors"
echo

ls fakefile 2> errors.txt


echo
echo "================================================="
echo "[ 32 ] Pipeline |"
echo "================================================="
echo "Purpose:"
echo "- Send output between commands"
echo

cat cyberlog.txt | grep "Failed"


echo
echo "================================================="
echo "[ 33 ] tee"
echo "================================================="
echo "Purpose:"
echo "- Display and save output"
echo

grep "Failed" cyberlog.txt | tee failedlogins.txt


echo
echo "================================================="
echo "[ 34 ] /dev/null"
echo "================================================="
echo "Purpose:"
echo "- Suppress output/errors"
echo

ping -c 1 8.8.8.8 &> /dev/null


echo
echo "================================================="
echo "[ 35 ] man"
echo "================================================="
echo "Purpose:"
echo "- Open manual pages"
echo

# man grep


echo
echo "================================================="
echo "[ 36 ] whatis"
echo "================================================="
echo "Purpose:"
echo "- Short command description"
echo

whatis grep


echo
echo "================================================="
echo "[ 37 ] --help"
echo "================================================="
echo "Purpose:"
echo "- Quick command help"
echo

grep --help


echo
echo "================================================="
echo "[ 38 ] Cybersecurity Examples"
echo "================================================="

echo "Search failed logins:"
echo 'grep "Failed password" auth.log'

echo
echo "Monitor logs:"
echo 'tail -f auth.log'

echo
echo "Find suspicious executables:"
echo 'find /tmp -name "*.sh"'

echo
echo "Check permissions:"
echo 'ls -la'

echo
echo "Check running user:"
echo 'whoami'


echo
echo "================================================="
echo "[ 39 ] Common Linux Paths"
echo "================================================="

echo "/home     user folders"
echo "/etc      configuration"
echo "/var/log  logs"
echo "/tmp      temporary files"
echo "/bin      binaries"
echo "/root     root home"


echo
echo "================================================="
echo "[ 40 ] Common Chapter 1 Workflow"
echo "================================================="

echo "pwd -> know location"
echo "ls -> inspect"
echo "cd -> navigate"
echo "find -> locate files"
echo "grep -> filter"
echo "tee -> save evidence"


echo
echo "================================================="
echo "[ 41 ] Important Notes"
echo "================================================="

echo "Linux is case-sensitive"
echo "rm -rf can be dangerous"
echo "sudo gives admin privileges"
echo "Permissions are critical"
echo "Logs are usually in /var/log"


echo
echo "================================================="
echo "[ 42 ] END"
echo "================================================="
