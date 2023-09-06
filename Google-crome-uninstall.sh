#################12.Google-crome uninstallation:
#check Google-crome is installed
if dpkg -s google-chrome-stable &> /dev/null; then
    echo "Google Chrome is installed. Uninstalling Google Chrome..."
    # Uninstall Google Chrome
    sudo apt-get purge google-chrome-stable -y
    echo "Google Chrome uninstalled successfully."
else
    echo "Google Chrome not found.need to install Google-crome."
fi
