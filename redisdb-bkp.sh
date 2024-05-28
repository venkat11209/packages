#datascraping api databse backup:
PWD=password
#backup command:
redis-cli -a $PWD config get dir
redis-cli -a $PWD save
#zip dump file and move to /opt/auto-backups/:
cd /var/lib/redis/
zip -r dump.rdb.zip dump.rdb
mv dump.rdb.zip /opt/auto-backups/

#auto push cdn to digitalocean:
cd /opt/auto-backups
s3cmd put -r dump.rdb.zip s3://code-backups/foldername/ --verbose --recursive
