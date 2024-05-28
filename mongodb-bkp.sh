###### Dump mongodb by script
cd /opt/auto-backups ##Dump files store path
DB=dbname
USRNME=user
PWD=userpassword
mongodump --port 27017 -d $DB --gzip --archive=DB-bkp.gz -u $USRNME -p $PWD --authenticationDatabase admin

#auto push cdn to digitalocean:
cd /opt/auto-backups
s3cmd put -r DB-bkp.gz s3://code-backups/foldername/ --verbose --recursive


##### restore mongodb by script
cd /opt/backups  ##Dump files available path
DB=links_watch
USRNME=linkswatchuser
PWD="linkswatch!#$%&pwd"
RDB=links_watch-DB-bkp.gz
mongorestore --nsInclude 'links_watch.*' --authenticationDatabase admin -u $USRNME -p $PWD --gzip --archive=$RDB
