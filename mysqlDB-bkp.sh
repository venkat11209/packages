##### Dump mysqldb by script
cd /opt/auto-backups  ##Dump files store path
DB=dbname
USRNME=root
PWD=rootpassword
mysqldump -u $USRNME -p$PWD $DB | gzip > DB-bkp.sql.gz

##auto push cdn to digitalocean:
cd /opt/auto-backups
s3cmd put -r DB-bkp.sql.gz s3://code-backups/foldername/ --verbose --recursive



##### Restore mysqldb by script
cd /opt/auto-backups  ##Dump files available path 
DB=dbname
USRNME=root
PWD=rootpassword
RDB=DB-bkp.sql.gz
gunzip < $RDB | mysql -u $USRNME -p$PWD $DB

