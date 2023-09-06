#############2.mongo-server uninstallation:
if [ -x "$(command -v mongod)" ]; then
    echo "MongoDB is already installed.uninstalling mongodb....."
	    sudo service mongod stop
		sudo apt-get purge mongodb-org*
		rm -rf /tmp/mongodb-27017.sock
		sudo rm -rf /var/log/mongodb
		sudo rm -rf /var/lib/mongodb
		rm -rf /usr/bin/mongo
		rm -rf /usr/share/man/man1/mongo.1.gz
        echo "mongodb is uninstalled successfully."
else
    echo "MongoDB not found.need to install mongodb"
fi
