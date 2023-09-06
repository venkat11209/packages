##################14.certbot uninstallation:
#check certbot is installed
if [ -x "$(command -v certbot)" ]; then
    echo "Certbot is installed. Uninstalling Certbot..."
    
    # Uninstall Certbot
    sudo apt-get remove certbot -y
    sudo apt-get purge certbot -y
    sudo apt-get autoremove -y
    
    echo "Certbot uninstalled successfully."
else
    echo "Certbot is not installed. Need to install Certbot."
fi
