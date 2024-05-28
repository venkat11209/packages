############### 6.nginx-server installation:
if [ $(dpkg-query -W -f='${Status}' nginx 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  echo "Nginx is not installed. Installing nginx-server..."
  sudo apt-get update
  sudo apt-get install nginx -y
  echo "Nginx installation complete."
else
  echo "Nginx is already installed."
fi

# Check if the default Nginx file exists in sites-available
if [ -f /etc/nginx/sites-available/default ]; then
    # Remove the default Nginx file from sites-available
    sudo rm /etc/nginx/sites-available/default
    echo "Default Nginx file removed from sites-available."
else
    echo "Default Nginx file not found in sites-available."
fi

# Check if the default Nginx file exists in sites-enabled
if [ -n "$(find /etc/nginx/sites-enabled/ -maxdepth 1 -type l -name 'default*' -print -quit)" ]; then
    # Remove the symlink from sites-enabled
    sudo unlink /etc/nginx/sites-enabled/default*
    echo "Default Nginx file removed from sites-enabled."
else
    echo "Default Nginx file not found in sites-enabled."
fi