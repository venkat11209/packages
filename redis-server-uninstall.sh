#############3.redis uninstallation:
if [ -x "$(command -v redis-cli)" ]; then
    echo "Redis is already installed.uninstalling redis...."
		sudo apt-get --purge remove redis-server -y
        sudo rm -rf /etc/redis/dump.rdb
        echo "redis is uninstalled successfully."
else
    echo "redis not found.need to install redis"
fi 
