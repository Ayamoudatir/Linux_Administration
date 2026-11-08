#!/bin/bash
LOG_FILE="/var/log/system_health.log"

exec >> "$LOG_FILE" 2>&1
echo "================================="
echo "System Health Report"
echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
echo "================================="
echo "-------System Health Check Script---------"
echo "hostname:$(hostname)"
echo "OS_VERSION:$(uname -r)"
echo "version_linux:$(lsb_release -a)"
echo "UP_since:$(uptime)"

echo "-------CPU Info---------"
echo "processor:$(top -bn1 | head -n 5 )"
echo "free_usage:$(free -h)"
echo "-------Disk Info---------"
echo "disk_usage :$(df -h)"
echo "-------Memory Info---------"
usage=50

if [ "$usage" -gt 80 ]; then
    echo "Disk usage is above 80%"
else
    echo "Disk usage is below 80%"
fi
echo "-------Network Info---------"
echo "Ip address:$(ip a)"
echo "test_connectivity:$(ping -c 4 google.com)"

echo "----Service Status----"
echo "service_ssh:$(systemctl status sshd)"
