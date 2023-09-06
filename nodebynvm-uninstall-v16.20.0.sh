###############8.node by nvm uninstallation:
if command -v node &> /dev/null; then
    echo "Node is already installed.uninstalling node..."
    sudo apt-get remove nodejs
    sudo apt-get purge nodejs
else
    echo "Node not found.need to install Node."
fi

# Check if NVM is already installed
if [ -s "$HOME/.nvm/nvm.sh" ]; then
    echo "NVM is already installed.uninstalling nvm..."
    rm -rf ~/.nvm
else
    echo "NVM not found.need to install nvm"
fi

# Check if npm is installed
if command -v npm &> /dev/null; then
    echo "npm is already installed.uninstalling npm..."
    rm -rf ~/.npm
    rm -rf ~/.bower
    rm -rf ~/.bower
    rm -rf $NVM_DIR ~/.npm ~/.bower
    echo "node by nvm uninstalled successfully.need to reboot your terminal"
    read -p "Are you sure you want to reboot the terminal? (y/n): " answer
else
    echo "npm not found.need to install npm"
fi

# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run with root privileges. Please run it as root or using sudo."
   exit 1
fi
# Check the user's response
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Rebooting the terminal..."
    sleep 3  # Optional delay to display the message before rebooting
    sudo reboot
else
    echo "Terminal reboot canceled."
fi
