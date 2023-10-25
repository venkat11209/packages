###########7.docker and docker-compose uninstallation:
# Check if Docker is installed
if [ -x "$(command -v docker)" ]; then
    # Uninstall Docker
    echo "Docker is already installed. uninstalling docker..."
    dpkg -l | grep -i docker
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt remove --purge docker-ce docker-ce-cli containerd.io -y
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd
    sudo apt autoremove -y
    sudo apt autoclean -y
    echo "docker is uninstalled successfully"
else
    echo "Docker not found. need to install docker"
    exit 0
fi
#Check if Docker Compose is installed
if [ -x "$(command -v docker-compose)" ]; then
    echo "Docker Compose is already installed. uninstalling docker-compose..."
    # Uninstall Docker Compose
    sudo rm /usr/local/bin/docker-compose
    echo "docker-compose uninstalled successfully"
    echo "need to restart the server to clear caches"
else
    echo "Docker Compose not found.need to install docker-compose..."
    exit 0
fi

