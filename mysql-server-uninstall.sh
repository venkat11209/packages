#############1.mysql-server&mysql-client uninstallation:
if [ -x "$(command -v mysql)" ]; then
    version=$(mysql -V | awk '{print $3}' | awk -F',' '{print $1}')
    if [ "$version" == ""$version ]; then
        echo "MySQL $version is already installed."
        echo "mysql is already installed.uninstalling mysql...."
        sudo systemctl stop mysql
        sudo apt purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-* -y
        sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql
        sudo apt autoremove -y
        sudo apt autoclean -y
        echo "mysql is uninstalled successfully."
    fi
 else
    echo "mysql not found.need to install mysql."
fi
