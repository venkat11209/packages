##############12.Go installation:
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
        read -p "Are you sure you want to reboot the terminal? (y/n): " answer
        
fi

#Check the user's response
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Rebooting the terminal..."
    sleep 3  # Optional delay to display the message before rebooting
    sudo reboot
else
    echo "Terminal reboot canceled."
fi