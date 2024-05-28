set -x
db_name='word_db'
db_user='word_dbuser'
db_pass='word_dbpass'
DOMAIN_NAME="domain.com"
#STEP 1: PREPARE AND UPDATE UBUNTU:
sudo apt update
#Nginx Installation:
if [ $(dpkg-query -W -f='${Status}' nginx 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  echo "Nginx is not installed. Installing..."
  sudo apt update
  sudo apt install nginx -y
  echo "Nginx installation complete."
else
  echo "Nginx is already installed."
fi

#Let’s Encrypt Installation:
# Check if certbot is installed
if ! command -v certbot &> /dev/null
then
    # Install certbot using npm
    echo "certbot not found. Installing certbot..."
    apt-get install certbot python3-certbot-nginx -y
else
    echo "certbot is already installed"
fi

#STEP 3: INSTALL PHP8.1:
desired_version="8.1"
if command -v php &>/dev/null; then
    php_version=$(php -r 'echo PHP_VERSION;')
    echo "PHP is already installed. Version: $php_version"
else
    # Install PHP if not found
    echo "PHP not found. Installing PHP $desired_version..."
    sudo apt-get update
    sudo apt-get install php$desired_version-fpm php$desired_version-common php$desired_version-mysql php$desired_version-xml php$desired_version-xmlrpc php$desired_version-curl php$desired_version-gd php$desired_version-imagick php$desired_version-cli php$desired_version-dev php$desired_version-imap php$desired_version-mbstring php$desired_version-opcache php$desired_version-redis php$desired_version-soap php$desired_version-zip -y
    sudo sed -i -e 's/post_max_size = 8M/post_max_size = 1000M/g' /etc/php/$desired_version/fpm/php.ini
    sudo sed -i -e 's/memory_limit = 128M/memory_limit = 2048M/g' /etc/php/$desired_version/fpm/php.ini
    sudo sed -i -e 's/max_execution_time = 30/max_execution_time = 360/g' /etc/php/$desired_version/fpm/php.ini
    sudo sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 10000M/g' /etc/php/$desired_version/fpm/php.ini

    echo "PHP $desired_version installed successfully."
fi
# Check if WordPress is already installed
if [ -d "/var/www/html/$DOMAIN_NAME/wp-admin" ]; then
    echo "WordPress is already installed."
else
    # WordPress installation steps go here
    echo "Installing WordPress..."
    cd /tmp && wget https://wordpress.org/latest.tar.gz
	tar -zxvf latest.tar.gz
	sudo mv wordpress /var/www/html/$DOMAIN_NAME
	sudo mv /var/www/html/$DOMAIN_NAME/wp-config-sample.php /var/www/html/$DOMAIN_NAME/wp-config.php  
	sed -i -e 's/database_name_here/'$db_name'/g' /var/www/html/$DOMAIN_NAME/wp-config.php  
	sed -i -e 's/username_here/'$db_user'/g' /var/www/html/$DOMAIN_NAME/wp-config.php  
	sed -i -e 's/password_here/'$db_pass'/g' /var/www/html/$DOMAIN_NAME/wp-config.php   
        #give folder and file permissions
	sudo chown -R www-data:www-data /var/www/html/$DOMAIN_NAME/
        sudo chmod -R 755 /var/www/html/$DOMAIN_NAME/
        sudo chmod -R 644 /var/www/html/$DOMAIN_NAME/index.php
        sudo chmod -R 600 /var/www/html/$DOMAIN_NAME/wp-config.php
	echo "WordPress installation completed."
fi

#create nginx reverse proxy for ip by using following code and create ssl for that domain
echo "creating nginx reverse proxy for ip and domain"
# Check if the default Nginx file exists in sites-available
if [ -f /etc/nginx/sites-available/default ]; then
    # Remove the default Nginx file from sites-available
    sudo rm /etc/nginx/sites-available/default
    echo "Default Nginx file removed from sites-available."
else
    echo "Default Nginx file not found in sites-available."
fi

# Check if the default Nginx file exists in sites-enabled
if [ -n "$(find /etc/nginx/sites-enabled/ -maxdepth 1 -type l -name 'default*' -print -quit)" ]; then
    # Remove the symlink from sites-enabled
    sudo unlink /etc/nginx/sites-enabled/default*
    echo "Default Nginx file removed from sites-enabled."
else
    echo "Default Nginx file not found in sites-enabled."
fi

# Check if the Nginx file with domain name already exists in sites-available
if [ -f "/etc/nginx/sites-available/${DOMAIN_NAME}" ]; then
    echo "${DOMAIN_NAME} Nginx file already exists in sites-available."
else
    echo "${DOMAIN_NAME} Nginx file not found in sites-available."

fi

# Check if the Nginx file with domain name is symlinked in sites-enabled
if [ -L "/etc/nginx/sites-enabled/${DOMAIN_NAME}" ]; then
    echo "${DOMAIN_NAME} Nginx file is symlinked in sites-enabled."
else
    echo "${DOMAIN_NAME} file not found or not symlinked in sites-enabled."
fi

FILE_PATH="/etc/nginx/sites-available"
FILE_NAME="${DOMAIN_NAME}"
# Define the data to write
DATA="server {
        root /var/www/html/$DOMAIN_NAME;
        index  index.php index.html index.htm;
        server_name ${DOMAIN_NAME};

        client_max_body_size 100000M;

        location / {
        try_files \$uri \$uri/ /index.php?\$args;
        }

        location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass            unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param   SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        }
}"
# Write the data to the file
echo "${DATA}" | sudo tee "${FILE_PATH}/${FILE_NAME}" > /dev/null
echo "created nginx reverse proxy for ip and domain"
#short link the config file for nginx
echo "creating shortlink for nginx files"
sudo ln -s /etc/nginx/sites-available/${DOMAIN_NAME} /etc/nginx/sites-enabled/
#ssl certificate to domain
echo "creating ssl for domains"
sudo certbot --nginx -d ${DOMAIN_NAME} --redirect
echo "Done creating ssl for domains"
# # Check if MySQL Server is installed
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
        echo "MySQL root password is already set.so failed to create db,db_user and db_password for wordpress.need to create manually.."
    fi
else
    echo "MySQL Server is not installed. Please install MySQL Server first."

    echo "install mysql-server"
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
	mysql -uroot -p${password} -e "CREATE DATABASE ${db_name}"
	mysql -uroot -p${password} -e "CREATE USER '${db_user}'@'localhost' IDENTIFIED BY '${db_pass}';"
	mysql -uroot -p${password} -e "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'localhost';"
	mysql -uroot -p${password} -e "FLUSH PRIVILEGES;"
    echo "Root user does not exist.so Root user and password created successfully."
	echo "wordpress installation successfully completed"
 fi


#if root password already existed use this commands to create db,db_user and db_password for wordpress by manually 
#db_name='word_db'
#db_user='word_dbuser'
#db_pass='word_dbpass'
#password='existed root_password'
#	mysql -uroot -p${password} -e "CREATE DATABASE ${db_name}"
#	mysql -uroot -p${password} -e "CREATE USER '${db_user}'@'localhost' IDENTIFIED BY '${db_pass}';"
#	mysql -uroot -p${password} -e "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'localhost';"
#	mysql -uroot -p${password} -e "FLUSH PRIVILEGES;"


#STEP 7: Restart php-fpm,mysql and nginx Services:
sudo systemctl restart nginx.service
sudo systemctl restart php$desired_version-fpm.service
sudo systemctl restart mysql.service
