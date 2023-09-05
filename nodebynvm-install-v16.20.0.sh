############9.node by nvm installation:
set -x

if command -v node &> /dev/null; then
    echo "Node is already installed."
else
    echo "Node is not found.need to install Node."
fi

# Check if NVM is already installed
if [ -s "$HOME/.nvm/nvm.sh" ]; then
    echo "NVM is already installed."
else
    echo "NVM is not installed.Installing node by nvm....."
    apt-get update
    apt-get install curl -y
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
    source ~/.nvm/nvm.sh
    echo "==> Installing node js version $INSTALL_NODE_VER"
    nvm install v16.20.0
    echo "==> Make this version system default"
    nvm alias default v16.20.0
    nvm use default
    echo "==> Checking for versions"
    nvm --version
    node --version
    npm --version
    echo "node by nvm installed succesfully.need to restart terminal."
    # Prompt the user for confirmation
    read -p "Are you sure you want to reboot the terminal? (y/n): " answer
fi

#Check if npm is installed
if command -v npm &> /dev/null; then
    echo "npm is already installed."
else
    echo "npm is not installed.need to install npm"
fi
# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run with root privileges. Please run it as root or using sudo."
   exit 1
fi

#Check the user's response
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Rebooting the terminal..."
    sleep 3  # Optional delay to display the message before rebooting
    sudo reboot
else
    echo "Terminal reboot canceled."
fi