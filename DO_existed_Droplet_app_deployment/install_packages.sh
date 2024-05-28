#!/bin/bash

# Pre-configure debconf to accept defaults
export DEBIAN_FRONTEND=noninteractive

# Configure grub-pc to avoid interactive prompts
echo "grub-pc grub-pc/install_devices multiselect /dev/sda" | debconf-set-selections

# Update and Upgrade the server
apt-get update && apt-get upgrade -y

# Install Node by Nvm and Npm
# Check if NVM is already installed
if [ -s "$HOME/.nvm/nvm.sh" ]; then
    echo "NVM is already installed."
else
    echo "NVM is not installed. Installing node by nvm..."
    apt-get install curl -y
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
    source ~/.nvm/nvm.sh
    echo "==> Installing node js version v16.20.0"
    nvm install v16.20.0
    echo "==> Make this version system default"
    nvm alias default v16.20.0
    nvm use default
    echo "==> Checking for versions"
    nvm --version
    node --version
    npm --version
    echo "Node by nvm installed successfully. Need to restart terminal."
fi

# Check if npm is installed
if command -v npm &> /dev/null; then
    echo "npm is already installed."
else
    echo "npm is not installed. Need to install npm."
fi

# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script needs to be run with root privileges. Please run it as root or using sudo."
   exit 1
fi

# Install nginx server
if [ $(dpkg-query -W -f='${Status}' nginx 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  echo "Nginx is not installed. Installing nginx-server..."
  apt-get install nginx -y
  echo "Nginx installation complete."
else
  echo "Nginx is already installed."
fi

# Check if the default Nginx file exists in sites-available
if [ -f /etc/nginx/sites-available/default ]; then
    rm /etc/nginx/sites-available/default
    echo "Default Nginx file removed from sites-available."
else
    echo "Default Nginx file not found in sites-available."
fi

# Check if the default Nginx file exists in sites-enabled
if [ -n "$(find /etc/nginx/sites-enabled/ -maxdepth 1 -type l -name 'default*' -print -quit)" ]; then
    unlink /etc/nginx/sites-enabled/default*
    echo "Default Nginx file removed from sites-enabled."
else
    echo "Default Nginx file not found in sites-enabled."
fi

# Install certbot
if ! command -v certbot &> /dev/null; then
    echo "certbot not found. Installing certbot..."
    apt-get install certbot python3-certbot-nginx -y
else
    echo "certbot is already installed."
fi

# Check if Go is already installed
if command -v go &>/dev/null; then
       echo "Go is installed"
   else
        echo "Go is not found.installing go..."
        sudo apt-get update
        wget https://dl.google.com/go/go1.20.2.linux-amd64.tar.gz
        sudo tar -xvf go1.20.2.linux-amd64.tar.gz
        sudo chown -R root:root ./go
        sudo mv go /usr/local
        # Add Go binaries to PATH
        echo 'export GOPATH=$HOME/work' >> ~/.profile
        echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile
        # Source the ~/.profile file
        source ~/.profile
        echo "Go installed succesfully."
        # Prompt the user for confirmation
        #read -p "Are you sure you want to reboot the terminal? (y/n): " answer
        
fi

# Schedule a reboot
echo "Scheduling a reboot..."
shutdown -r +1 "Rebooting in 1 minute to complete the installation."

echo "Script completed. The system will reboot in 1 minute."
exit 0

