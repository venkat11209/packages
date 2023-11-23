desired_version="7.4.33"

if [ -x "$(command -v php)" ]; then
    current_version=$(php -r "echo PHP_VERSION;")

    if [ "$current_version" == "$desired_version" ]; then
        echo "PHP $desired_version is already installed."
    else
        echo "Upgrading PHP to version $desired_version..."
        sudo add-apt-repository ppa:ondrej/php -y
        sudo apt-get update
        sudo apt-get install php7.4-fpm php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-redis php7.4-soap php7.4-zip -y
        sed -i -e 's/post_max_size = 8M/post_max_size = 1000M/g' /etc/php/7.4/fpm/php.ini
        sed -i -e 's/memory_limit = 128M/memory_limit = 2048M/g' /etc/php/7.4/fpm/php.ini
        sed -i -e 's/max_execution_time = 30/max_execution_time = 360/g' /etc/php/7.4/fpm/php.ini
        sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 10000M/g' /etc/php/7.4/fpm/php.ini

        echo "PHP upgraded to version $desired_version successfully."
    fi
else
    echo "PHP not found. Installing PHP $desired_version."
    sudo add-apt-repository ppa:ondrej/php -y
    sudo apt-get update
    sudo apt-get install php7.4-fpm php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-redis php7.4-soap php7.4-zip -y
    sed -i -e 's/post_max_size = 8M/post_max_size = 1000M/g' /etc/php/7.4/fpm/php.ini
    sed -i -e 's/memory_limit = 128M/memory_limit = 2048M/g' /etc/php/7.4/fpm/php.ini
    sed -i -e 's/max_execution_time = 30/max_execution_time = 360/g' /etc/php/7.4/fpm/php.ini
    sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 10000M/g' /etc/php/7.4/fpm/php.ini

    echo "PHP $desired_version installed successfully."
fi
