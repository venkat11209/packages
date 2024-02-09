###Delete digitalocean olderthan 3 months backup files script
set -x
# Define your DigitalOcean Spaces bucket name
DATE=$(date "+%Y-%m-%d %H:%M:%S")
BUCKET_NAME="new-backups"
# Define the folders in the bucket where you want to delete files and folders
FOLDER_NAME_1="weekly-backups/Leadswatch-mongo-bkp"
FOLDER_NAME_2="weekly-backups/Linkswatch-database-bkp"
FOLDER_NAME_3="weekly-backups/Mlsdata-redisdb-bkp"
FOLDER_NAME_4="weekly-backups/Nuke-Database-bkp"
FOLDER_NAME_5="weekly-backups/Verifyemail-DB-bkp"
FOLDER_NAME_6="weekly-backups/api.Neodarfts.com-bkp"
FOLDER_NAME_7="weekly-backups/apiblog.shadow.properties-bkp"
FOLDER_NAME_8="weekly-backups/datascraping-api-bkp"
FOLDER_NAME_9="weekly-backups/leadswatch-replica-bkp"
FOLDER_NAME_10="weekly-backups/shadow.properties-bkp"
FOLDER_NAME_11="weekly-backups/sp-botredis-1-bkp"
FOLDER_NAME_12="weekly-backups/sp-drive-redisdb-bkp"
FOLDER_NAME_13="weekly-backups/sp-mongoreplica-bkp"
FOLDER_NAME_14="weekly-backups/sp-mongotesting-new-bkp"
FOLDER_NAME_15="weekly-backups/sp-property-redisdb-bkp"
FOLDER_NAME_16="weekly-backups/unsub-db-bkp"

# Calculate the timestamp for three months ago
OLDER_THAN=$(date -d "3 months ago" +%s)

# Log file to keep track of deleted files and folders
LOG_FILE="/opt/Digitalocean-bkps-del-script/delete_do_bkps_log_file.txt"
echo "script running date is: [$DATE]" >> "$LOG_FILE"
# Iterate over each folder name in the array
for FOLDER_NAME in "$FOLDER_NAME_1" "$FOLDER_NAME_2" "$FOLDER_NAME_3" "$FOLDER_NAME_4" "$FOLDER_NAME_5" "$FOLDER_NAME_6" "$FOLDER_NAME_7" "$FOLDER_NAME_8" "$FOLDER_NAME_9" "$FOLDER_NAME_10" "$FOLDER_NAME_11" "$FOLDER_NAME_12" "$FOLDER_NAME_13" "$FOLDER_NAME_14" "$FOLDER_NAME_15" "$FOLDER_NAME_16"; do
    # List files and folders in the specified folder recursively and delete those older than three months
    s3cmd ls -r "s3://$BUCKET_NAME/$FOLDER_NAME/" | while read -r line; do
        item_date=$(echo "$line" | awk '{print $1 " " $2}')
        item_timestamp=$(date -d "$item_date" +%s)
        if [ "$item_timestamp" -lt "$OLDER_THAN" ]; then
            item_name=$(echo "$line" | awk '{print $4}')
            echo "Deleting $item_name"
            # Append deleted item to log file
            echo "Deleted $item_name" >> "$LOG_FILE"
            s3cmd del --recursive "$item_name"
        fi
    done
done
