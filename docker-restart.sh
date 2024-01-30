THRESHOLD=70
LOG_FILE="/opt/docker-restart/restart_containers.log"
CURRENT_USAGE=$(df -h /var/lib/docker/ | awk 'NR==2 {print $5}' | cut -d'%' -f1)
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$DATE] Checking disk usage..." >> "$LOG_FILE"
echo "[$DATE] Current disk usage: $CURRENT_USAGE%" >> "$LOG_FILE"
if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    echo "[$DATE] Disk usage is above $THRESHOLD%. Stopping and removing Docker containers..." >> "$LOG_FILE"

    # Stop and remove all running containers
    docker stop $(docker ps -q)
    docker rm $(docker ps -aq)
    echo "[$DATE] All Docker containers stopped and removed." >> "$LOG_FILE"

    # Restart docker containers
    /usr/local/bin/docker-compose -f /var/www/html/docker-campaigns/docker-compose.yml up -d
    echo "[$DATE] Docker containers restarted." >> "$LOG_FILE"
else
    echo "[$DATE] Disk usage is below $THRESHOLD%. No action required." >> "$LOG_FILE"
fi
