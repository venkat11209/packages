#################11.Tor uninstallation:
# Check if Tor is installed
if command -v go &>/dev/null; then
    echo "Tor is installed. Uninstalling Tor..."
    # Uninstall Tor
    sudo apt-get remove tor -y
    echo "Tor uninstalled successfully."
else
    echo "Tor not found. Need to install Tor."
fi
