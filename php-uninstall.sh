##php unistall with desired version on ubuntu
desired_version="8.1"
php_version="php$desired_version"

# Check if PHP is installed
if [ -x "$(command -v $php_version)" ]; then
    # Uninstall PHP
    echo "Uninstalling PHP $desired_version..."
    sudo apt-get purge $php_version-* -y
    sudo apt-get autoremove -y
    sudo apt-get clean -y

    echo "PHP $desired_version uninstalled successfully."
else
    # PHP is not installed
    echo "PHP $desired_version is not installed."
fi

