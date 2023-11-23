#############5.php uninstallation:
if [ -x "$(command -v php)" ]; then
    version=$(php -r "echo PHP_VERSION;")
    if [ "$version" == "7.4.33" ]; then
        echo "PHP 7.4.33 is already installed."
        echo "Uninstalling existing PHP..."
        sudo apt-get remove --purge php7.4* -y
        sudo apt-get autoremove -y
        sudo apt-get clean -y

        echo "Existing PHP uninstalled."
    fi
else
    echo "PHP 7.4.33 not found. Need to install PHP 7.4.33."
fi
