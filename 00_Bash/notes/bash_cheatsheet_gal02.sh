#!/bin/bash

# ============================================================

# CSIS 3560 - Scripting for Cybersecurity

# Script Name : bash_cheatsheet_gal02.sh

# Name        : Giovan Alarcon

# Student ID  : 300394602

# SGL Prefix  : gal02

# Date        : $(date +"%Y-%m-%d")

# Purpose     : Beginner-friendly Bash cheatsheet with safe,

# practical cybersecurity-style examples.

# ============================================================

# -----------------------------

# SGL-style variables

# -----------------------------

gal02_name="Giovan Alarcon"
gal02_student_id="300394602"
gal02_script_name="$(basename "$0")"
gal02_date="$(date +"%Y-%m-%d %H:%M:%S")"
gal02_practice_dir="$HOME/bash_cheatsheet_gal02_practice"
gal02_kali_user="gal02"
gal02_kali_host="kali3560"
gal02_kali_ip="10.1.41.xxx"

# -----------------------------

# Helper functions

# -----------------------------

print_section()
{
echo
echo "============================================================"
echo "$1"
echo "============================================================"
}

run_example()
{
echo
echo "COMMAND:"
echo "$1"
echo "OUTPUT:"
eval "$1"
}

print_note()
{
echo
echo "NOTE:"
echo "$1"
}

# -----------------------------

# Header

# -----------------------------

clear
print_section "CSIS 3560 Bash Cheatsheet - gal02"

echo "Name       : $gal02_name"
echo "Student ID : $gal02_student_id"
echo "Script     : $gal02_script_name"
echo "Date       : $gal02_date"
echo "Purpose    : Practical Bash command examples for cybersecurity scripting"

# -----------------------------

# Create practice folder/files

# -----------------------------

print_section "Creating Practice Folder and Sample Files"

mkdir -p "$gal02_practice_dir"
mkdir -p "$gal02_practice_dir/logs"
mkdir -p "$gal02_practice_dir/scripts"
mkdir -p "$gal02_practice_dir/reports"
mkdir -p "$gal02_practice_dir/.hidden"

cat > "$gal02_practice_dir/logs/auth.log" << 'EOF'
2026-06-06 08:01:10 LOGIN_SUCCESS user=gal02 ip=192.168.1.10 port=22
2026-06-06 08:05:20 LOGIN_FAILED user=root ip=10.1.41.135 port=22
2026-06-06 08:07:33 LOGIN_FAILED user=admin ip=10.1.41.136 port=22
2026-06-06 08:10:44 LOGIN_SUCCESS user=student ip=192.168.1.20 port=443
2026-06-06 08:15:01 LOGIN_FAILED user=test ip=172.16.5.10 port=21
2026-06-06 08:20:55 LOGIN_SUCCESS user=analyst ip=192.168.1.30 port=80
2026-06-06 08:25:18 LOGIN_FAILED user=root ip=10.1.41.135 port=22
2026-06-06 08:30:45 LOGIN_SUCCESS user=gal02 ip=192.168.1.10 port=22
EOF

cat > "$gal02_practice_dir/users.csv" << 'EOF'
username,role,status
gal02,student,active
admin,administrator,active
guest,visitor,disabled
analyst,soc,active
test,temp,disabled
EOF

cat > "$gal02_practice_dir/processes.txt" << 'EOF'
PID;Process;Owner;Port
101;sshd;root;22
203;nginx;www-data;80
305;mysql;mysql;3306
410;python3;gal02;8080
512;apache2;www-data;443
EOF

cat > "$gal02_practice_dir/pid_owner.txt" << 'EOF'
PID;Department
101;Infrastructure
203;Web
305;Database
410;Security
512;Web
EOF

cat > "$gal02_practice_dir/ip_hosts.txt" << 'EOF'
IP;Hostname
192.168.1.10;ubuntu3560
10.1.41.134;kali3560
192.168.1.20;windows-host
172.16.5.10;testing-server
EOF

cat > "$gal02_practice_dir/scripts/check_system_gal02.sh" << 'EOF'
#!/bin/bash
echo "Remote/local system check"
hostname
whoami
hostname -I
EOF

chmod +x "$gal02_practice_dir/scripts/check_system_gal02.sh"

cat > "$gal02_practice_dir/permissions.txt" << 'EOF'
-rw-r--r-- gal02 report.txt
-rwxr-xr-x gal02 script.sh
-rw------- root shadow_backup
drwxr-xr-x gal02 logs
EOF

echo "secret test file" > "$gal02_practice_dir/.hidden/.hidden_note.txt"
echo "This is a normal text file." > "$gal02_practice_dir/reports/report.txt"
gzip -c "$gal02_practice_dir/reports/report.txt" > "$gal02_practice_dir/reports/report.txt.gz"

echo "Practice folder created at: $gal02_practice_dir"

# ============================================================

# Chapter 1

# ============================================================

print_section "Chapter 1: Linux Basics, Files, and Redirection"

run_example "pwd"
run_example "ls -la "$gal02_practice_dir""

print_note "Redirection examples: > overwrites, >> appends, 2> redirects errors, &> redirects output and errors."

run_example "echo 'Security report created by gal02' > "$gal02_practice_dir/reports/redirection_report.txt""
run_example "echo 'Second line appended' >> "$gal02_practice_dir/reports/redirection_report.txt""
run_example "cat "$gal02_practice_dir/reports/redirection_report.txt""

run_example "ls "$gal02_practice_dir/no_such_file" 2> "$gal02_practice_dir/reports/error.log""
run_example "cat "$gal02_practice_dir/reports/error.log""

run_example "ls "$gal02_practice_dir" &> "$gal02_practice_dir/reports/stdout_stderr.log""
run_example "cat "$gal02_practice_dir/reports/stdout_stderr.log""

run_example "echo 'Using tee to show output and save it' | tee "$gal02_practice_dir/reports/tee_example.txt""

# ============================================================

# file

# ============================================================

print_section "file Command: Identify File Types"

# file checks the real type of a file.

run_example "file "$gal02_practice_dir/reports/report.txt""
run_example "file "$gal02_practice_dir/scripts/check_system_gal02.sh""
run_example "file "$gal02_practice_dir/reports/report.txt.gz""
run_example "file "$gal02_practice_dir"/*"

# ============================================================

# head

# ============================================================

print_section "head Command: Read the First Lines or Bytes"

# head is useful to quickly preview the beginning of a file.

run_example "head -5 "$gal02_practice_dir/logs/auth.log""
run_example "head -n 3 "$gal02_practice_dir/users.csv""
run_example "head -c 40 "$gal02_practice_dir/logs/auth.log""

# ============================================================

# tail

# ============================================================

print_section "tail Command: Read the Last Lines"

# tail is useful for checking the most recent lines in logs.

run_example "tail -5 "$gal02_practice_dir/logs/auth.log""
run_example "tail -n 3 "$gal02_practice_dir/logs/auth.log""

echo
echo "COMMENTED EXAMPLE:"
echo "tail -f /var/log/auth.log"
echo "# tail -f follows a log file live. Press Ctrl+C to stop."

# ============================================================

# Chapter 2

# ============================================================

print_section "Chapter 2: Text Processing"

# ============================================================

# cut

# ============================================================

print_section "cut Command: Extract Characters and Fields"

# Extract characters from each line.

run_example "cut -c1-10 "$gal02_practice_dir/logs/auth.log""

# Extract fields from a CSV file using comma as delimiter.

run_example "cut -d ',' -f1,2 "$gal02_practice_dir/users.csv""

# Extract fields from semicolon-delimited process data.

run_example "cut -d ';' -f1,2,4 "$gal02_practice_dir/processes.txt""

# Combine grep and cut to extract users from failed logins.

run_example "grep 'LOGIN_FAILED' "$gal02_practice_dir/logs/auth.log" | cut -d ' ' -f4"

# Combine head and cut.

run_example "head -3 "$gal02_practice_dir/users.csv" | cut -d ',' -f1"

# Combine tail and cut.

run_example "tail -3 "$gal02_practice_dir/logs/auth.log" | cut -d ' ' -f3,4,5"

# ============================================================

# tr

# ============================================================

print_section "tr Command: Translate, Replace, Squeeze, and Delete Characters"

# Convert lowercase to uppercase.

run_example "echo 'security analyst gal02' | tr 'a-z' 'A-Z'"

# Replace commas with semicolons.

run_example "cat "$gal02_practice_dir/users.csv" | tr ',' ';'"

# Squeeze repeated spaces into one space.

run_example "echo 'gal02     security     scripting' | tr -s ' '"

# Delete digits.

run_example "echo 'user123 failed login 456' | tr -d '0-9'"

# Convert semicolons to tabs.

run_example "cat "$gal02_practice_dir/processes.txt" | tr ';' '\t'"

# ============================================================

# sed

# ============================================================

print_section "sed Command: Stream Editing Without Changing Original Files"

# Substitute the first match in each line.

run_example "sed 's/LOGIN_FAILED/FAILED_ATTEMPT/' "$gal02_practice_dir/logs/auth.log""

# Substitute globally.

run_example "echo 'port=22 port=22 port=80' | sed 's/port/SERVICE_PORT/g'"

# Delete lines containing disabled users.

run_example "sed '/disabled/d' "$gal02_practice_dir/users.csv""

# Print a specific line.

run_example "sed -n '3p' "$gal02_practice_dir/logs/auth.log""

# Replace in stream only.

run_example "cat "$gal02_practice_dir/users.csv" | sed 's/active/enabled/g'"

echo
echo "COMMENTED EXAMPLE:"
echo "sed -i 's/old/new/g' file.txt"
echo "# sed -i modifies the original file. Be careful and make a backup first."

# ============================================================

# Chapter 3

# ============================================================

print_section "Chapter 3: Searching Files and Content"

# ============================================================

# grep

# ============================================================

print_section "grep Command: Search Inside Files"

# Basic search.

run_example "grep 'LOGIN_FAILED' "$gal02_practice_dir/logs/auth.log""

# Case-insensitive search.

run_example "grep -i 'login_success' "$gal02_practice_dir/logs/auth.log""

# Count matches.

run_example "grep -c 'LOGIN_FAILED' "$gal02_practice_dir/logs/auth.log""

# Show line numbers.

run_example "grep -n 'root' "$gal02_practice_dir/logs/auth.log""

# Recursive search.

run_example "grep -R 'gal02' "$gal02_practice_dir""

# Extended regex.

run_example "grep -E 'LOGIN_FAILED|LOGIN_SUCCESS' "$gal02_practice_dir/logs/auth.log""

# Search IP addresses.

run_example "grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$gal02_practice_dir/logs/auth.log""

# Search ports.

run_example "grep -E 'port=22|port=443' "$gal02_practice_dir/logs/auth.log""

# ============================================================

# find

# ============================================================

print_section "find Command: Search for Files and Directories"

# Find by name.

run_example "find "$gal02_practice_dir" -name '*.txt'"

# Find by type: files.

run_example "find "$gal02_practice_dir" -type f"

# Find by type: directories.

run_example "find "$gal02_practice_dir" -type d"

# Find hidden files.

run_example "find "$gal02_practice_dir" -name '.*'"

# Find by size.

run_example "find "$gal02_practice_dir" -type f -size +0c"

# Find by modification time: modified in the last 1 day.

run_example "find "$gal02_practice_dir" -type f -mtime -1"

# Find by access time: accessed in the last 1 day.

run_example "find "$gal02_practice_dir" -type f -atime -1"

# Find and execute file command.

run_example "find "$gal02_practice_dir" -type f -name '*.sh' -exec file '{}' \;"

# Redirect permission errors to /dev/null.

run_example "find /root -type f 2>/dev/null | head -5"

# ============================================================

# Chapter 4

# ============================================================

print_section "Chapter 4: Remote Connections and Data Transfer"

print_note "The following SSH and SCP examples are printed only. They are safe because this script does not automatically connect to Kali."

echo
echo "SSH service status:"
echo "systemctl status ssh"

echo
echo "Start SSH service:"
echo "sudo systemctl start ssh"

echo
echo "Enable SSH service at boot:"
echo "sudo systemctl enable ssh"

echo
echo "Restart SSH service:"
echo "sudo systemctl restart ssh"

echo
echo "Generate SSH key:"
echo "ssh-keygen -t ed25519 -C "gal02@Ubuntu3560""

echo
echo "Copy SSH public key to Kali:"
echo "ssh-copy-id $gal02_kali_user@$gal02_kali_host"
echo "ssh-copy-id $gal02_kali_user@$gal02_kali_ip"

echo
echo "Connect from Ubuntu to Kali:"
echo "ssh $gal02_kali_user@$gal02_kali_host"

echo
echo "Run remote commands on Kali:"
echo "ssh $gal02_kali_user@$gal02_kali_host hostname"
echo "ssh $gal02_kali_user@$gal02_kali_host whoami"
echo "ssh $gal02_kali_user@$gal02_kali_host 'hostname -I'"

echo
echo "Redirect local command output to a local file:"
echo "hostname -I > ubuntu_ip_gal02.txt"

echo
echo "Redirect remote command output to a local file:"
echo "ssh $gal02_kali_user@$gal02_kali_host 'hostname -I' > kali_ip_gal02.txt"

echo
echo "Redirect output on the remote Kali machine:"
echo "ssh $gal02_kali_user@$gal02_kali_host 'hostname -I > kali_remote_ip_gal02.txt'"

echo
echo "Execute a local Bash script on the remote Kali machine:"
echo "ssh $gal02_kali_user@$gal02_kali_host 'bash -s' < $gal02_practice_dir/scripts/check_system_gal02.sh"

# ============================================================

# scp

# ============================================================

print_section "scp Command: Secure Copy Between Ubuntu and Kali"

echo
echo "Copy one local file from Ubuntu to Kali:"
echo "scp $gal02_practice_dir/reports/report.txt $gal02_kali_user@$gal02_kali_host:/home/gal02/"

echo
echo "Copy one remote file from Kali to Ubuntu:"
echo "scp $gal02_kali_user@$gal02_kali_host:/home/gal02/kali_report.txt $gal02_practice_dir/reports/"

echo
echo "Copy a local directory recursively to Kali:"
echo "scp -r $gal02_practice_dir/reports $gal02_kali_user@$gal02_kali_host:/home/gal02/"

echo
echo "Copy to a custom destination folder on Kali:"
echo "scp $gal02_practice_dir/users.csv $gal02_kali_user@$gal02_kali_host:/home/gal02/Documents/"

# ============================================================

# Chapter 5

# ============================================================

print_section "Chapter 5: Advanced Text Processing"

# ============================================================

# awk

# ============================================================

print_section "awk Command: Columns, Conditions, Ranges, and Formatting"

# Print specific columns.

run_example "awk '{print $1, $3, $4}' "$gal02_practice_dir/logs/auth.log""

# Print a specific line.

run_example "awk 'NR==3' "$gal02_practice_dir/logs/auth.log""

# Conditional print.

run_example "awk '$3 == "LOGIN_FAILED" {print}' "$gal02_practice_dir/logs/auth.log""

# Conditional print with selected field.

run_example "awk '$3 == "LOGIN_FAILED" {print $4, $5}' "$gal02_practice_dir/logs/auth.log""

# Print a range of lines.

run_example "awk 'NR>=2 && NR<=5 {print}' "$gal02_practice_dir/logs/auth.log""

# Use separator with -F.

run_example "awk -F ',' '{print $1, $2}' "$gal02_practice_dir/users.csv""

# Conditional print using CSV separator.

run_example "awk -F ',' '$3 == "active" {print $1, $2}' "$gal02_practice_dir/users.csv""

# Iterate through fields.

run_example "awk -F ';' 'NR==2 {for(i=1; i<=NF; i++) print "Field", i, "=", $i}' "$gal02_practice_dir/processes.txt""

# Count failed events.

run_example "awk '$3 == "LOGIN_FAILED" {count++} END {print "Failed logins:", count}' "$gal02_practice_dir/logs/auth.log""

# Print formatted output.

run_example "awk -F ';' 'NR>1 {printf "PID: %-5s Process: %-10s Owner: %-10s Port: %s\n", $1, $2, $3, $4}' "$gal02_practice_dir/processes.txt""

# ============================================================

# join

# ============================================================

print_section "join Command: Join Files by a Common Field"

print_note "join requires files to be sorted by the join field."

run_example "sort -t ';' -k1,1 "$gal02_practice_dir/processes.txt" > "$gal02_practice_dir/processes_sorted.txt""
run_example "sort -t ';' -k1,1 "$gal02_practice_dir/pid_owner.txt" > "$gal02_practice_dir/pid_owner_sorted.txt""

# Join two files using PID as the common field.

run_example "join -t ';' -1 1 -2 1 "$gal02_practice_dir/processes_sorted.txt" "$gal02_practice_dir/pid_owner_sorted.txt""

# Cybersecurity-style IP + hostname example.

run_example "cat "$gal02_practice_dir/ip_hosts.txt""

# ============================================================

# Extra Combined Examples

# ============================================================

print_section "Extra Combined Examples: Pipelines for Cybersecurity Logs"

# Count failed login attempts by user.

run_example "grep 'LOGIN_FAILED' "$gal02_practice_dir/logs/auth.log" | awk '{print $4}' | sort | uniq -c"

# Extract unique IP addresses.

run_example "grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$gal02_practice_dir/logs/auth.log" | sort | uniq"

# Show top 3 log lines and extract event + user.

run_example "head -3 "$gal02_practice_dir/logs/auth.log" | awk '{print $3, $4}'"

# Convert CSV users to semicolon format and uppercase.

run_example "cat "$gal02_practice_dir/users.csv" | tr ',' ';' | tr 'a-z' 'A-Z'"

# ============================================================

# Summary

# ============================================================

print_section "Summary"

echo "This cheatsheet covered:"
echo "- cut, file, head, tail"
echo "- grep and find"
echo "- ssh, ssh-keygen, ssh-copy-id, scp"
echo "- awk, join, sed, tr"
echo "- Redirection: >, >>, 2>, 2>/dev/null, &>, tee"
echo
echo "Practice folder:"
echo "$gal02_practice_dir"
echo
echo "Reminder:"
echo "SSH examples require:"
echo "1. SSH service installed and running on Kali."
echo "2. Network connectivity between Ubuntu and Kali."
echo "3. Correct hostname in /etc/hosts or use the Kali IP."
echo "4. Passwordless authentication configured with ssh-keygen and ssh-copy-id."
echo
echo "The practice files were NOT deleted so you can review them later."
echo "End of script."
