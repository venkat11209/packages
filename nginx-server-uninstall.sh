###########6.nginx-servrer uninstallation:
if [ -x "$(command -v nginx)" ]; then
    echo "Nginx is already installed.uninstalling nginx-server...."
	sudo apt-get remove nginx nginx-common -y
    sudo apt-get purge nginx nginx-common -y
	echo "nginx-server uninstalled successfully."
else
    echo "Nginx-server not found.need to install nginx-server."
fi
