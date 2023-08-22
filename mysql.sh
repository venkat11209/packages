#############1.mysql-server&mysql-client installation:
if [ -x "$(command -v mysql)" ]; then
    version=$(mysql -V | awk '{print $3}' | awk -F',' '{print $1}')
    if [ "$version" == ""$version ]; then
        echo "MySQL $version is already installed."
    else
	  echo "display existed mysql-server version"
      version1=$(mysql -V 2>&1 | awk '{print $5}')

      # Extract the version number
      version_number=$(echo "$version1" | awk -F. '{print $1}')

      #Print the version information
      echo "MySQL version: $version1"
      echo "MySQL version number: $version_number"
    fi
else
    echo "mysql is not installed. need to Installing mysql"
    
fi

if [ -x "$(command -v mysql_config_editor)" ]; then
    # Check if the MySQL root password is set
    mysql_config_editor print --login-path=root > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "MySQL root password is already set."
        echo "need to create db,db_user and db_password for wordpress by manually"
    fi
else
    echo "MySQL Server is not installed.install MySQL Server...."
    # Install MySQL Server
    sudo apt-get update
    sudo apt-get install -y mysql-server

    # Start and enable MySQL service
    sudo systemctl start mysql
    sudo systemctl enable mysql
    echo "set root password when asking on command line"
    read -sp "Enter new root password: " password
    echo
    mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${password}';"
	mysql -uroot -p${password} -e "exit;"
    echo "Root user does not exist.so Root user and password created successfully."
 fi
