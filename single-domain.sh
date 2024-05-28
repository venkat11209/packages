#!bin/bash edit-8
set -x
#enter domain name here to install
DOMAIN_NAME="leadswatch.com"
IP="103.170.86.50"
hostnamectl set-hostname ${DOMAIN_NAME}
if command -v vim &>/dev/null; then
    echo "Vim is already installed."
	sed -i 's/127.0.1.1 your-server-hostname/'${IP}' '${DOMAIN_NAME}'/g' /etc/hosts
else
    # Install Vim
    echo "Installing Vim..."
	apt-get install vim -y
    sed -i 's/127.0.1.1 your-server-hostname/'${IP}' '${DOMAIN_NAME}'/g' /etc/hosts
	echo "vim installed successfully."
fi

#pm2 installation:
#Check if PM2 is already installed
if command -v pm2 &> /dev/null; then
    echo "PM2 is already installed."
else
    # Install PM2
    echo "Installing PM2..."
    npm install -g pm2

    # Check if PM2 installation was successful
    if command -v pm2 &> /dev/null; then
        echo "PM2 installed successfully."
    else
        echo "Failed to install PM2. Please check your Node.js installation and npm configuration."
    fi
fi

#python Installation:
# Check if python is installed
if ! command --version python &> /dev/null
then
     #Install python
	 echo "installing python..."
     apt-get update
     apt-get install -y build-essential
     npm config set user 0 && npm config set unsafe-perm true
     sudo chown -R $(whoami) /root/.nvm/versions/node/
     apt-get install python2.7 -y
     ln -s /usr/bin/python2.7 /usr/bin/python
else
     echo "Pyhton is already installed"
fi

#Haraka Installation:
# Check if haraka is installed
if ! command -v haraka &> /dev/null
then
     #Install haraka using npm
    echo "haraka not found. Installing haraka using npm..."
    npm install Haraka@2.8.27 -g
else
    echo "Haraka is already installed"
fi

#Git Installation:
# Check if git is installed
if ! command -v git &> /dev/null
then
    # Install haraka using npm
    echo "git not found. Installing git..."
    apt-get install git
else
    echo "git is already installed"
fi

#Nginx Installation:
if [ $(dpkg-query -W -f='${Status}' nginx 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  echo "Nginx is not installed. Installing..."
  sudo apt-get update
  sudo apt-get install nginx -y
  echo "Nginx installation complete."
else
  echo "Nginx is already installed."
fi


#Let’s Encrypt Installation:
# Check if certbot is installed
if ! command -v certbot &> /dev/null
then
    # Install certbot using npm
    echo "certbot not found. Installing certbot..."
    apt-get install certbot python3-certbot-nginx -y
else
    echo "certbot is already installed"
fi

#Redis Installation:
# Check if redis is installed
if ! command -v redis-server &> /dev/null
then
    # Install redis-server
    echo "redis-server not found. Installing redis-server..."
    apt-get update && apt-get install redis-server -y
    sed -i 's/# requirepass foobared/requirepass es-nuke@2k21/g' /etc/redis/redis.conf
    sed -i 's/bind 127.0.0.1 ::1/ bind 0.0.0.0 ::1/g' /etc/redis/redis.conf
    systemctl restart redis-server
    systemctl enable redis-server
else
    echo "redis-server is already installed.So Failed to add password in redis.conf"
fi

#Swaks Installation:
# Check if swaks is installed
if ! command -v swaks &> /dev/null
then
    # Install swaks
    echo "swaks not found. Installing swaks..."
    apt-get update && apt-get install swaks -y
else
    echo "swaks is already installed"
fi


#Mongo Installation:
if ! command -v mongo &> /dev/null
then
    # Install mongo
    echo "mongo not found. Installing mongo..."
    sudo apt-get install gnupg -y
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list 
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    mongo --version
    echo "mongodb-org hold" | sudo dpkg --set-selections
    echo "mongodb-org-server hold" | sudo dpkg --set-selections
    echo "mongodb-org-shell hold" | sudo dpkg --set-selections
    echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
    echo "mongodb-org-tools hold" | sudo dpkg --set-selections
    sudo systemctl start mongod
    sudo systemctl enable mongod
    #sudo systemctl status mongod

        
    # Start the MongoDB shell with administrative privileges
    echo "db.createUser( { user:'esnuke' , pwd:'Es-nuke2k21',roles: [ { role: 'root', db: 'admin' } ]})" | sudo mongo admin
    echo "db.auth('esnuke','Es-nuke2k21')" | sudo mongo admin
    echo "User created successfully."
    # Set the path to the mongod.conf file
    sudo sh -c 'echo "security:\n  authorization: enabled" >> /etc/mongod.conf'
    systemctl stop mongod
    systemctl restart mongod
   
else
    echo "mongo is already installed.So failed to create again mongo user,password and database"
fi

# Create Haraka Project and Configure
if [ -d "/var/mail-server" ]; then
    echo "mail-server already existed.So Failed to clone mail-server."
else
	cd /var/
	echo "cloning git repo of mail-server..."
	git clone -b dev https://your_personal_access_token@github.com/fissioninfotech/mail-server.git
	echo "cloning mail-server successfully."
fi
# cd /var/mail-server/config
# add all domains here to add in auth_flat_file
FILE_PATH="/var/mail-server/config"
FILE_NAME="auth_flat_file.ini"
# Define the data to write
DATA="me@${DOMAIN_NAME}=${DOMAIN_NAME}@123"
# Write the data to the file
echo "${DATA}" > "${FILE_PATH}/${FILE_NAME}"
echo "adding domains data to authorization file completed"

#Install the following commands in haraka Project:
echo "installing haraka modules in mail-server"
cd /var/mail-server
npm i
npm i -g ip
npm i -g time-zone
npm i -g moment-timezone
npm i -g socket.io-client@2.3.0
npm i -g socket.io-server
npm i -g cors
npm install -g express
npm install haraka-plugin-mongodb
npm install mongodb
echo "installation complete"

#Add all our domains in the following file
echo "Adding domains in host_list file"
FILE_PATH="/var/mail-server/config"
FILE_NAME="host_list"
# Define the data to write
DATA="${DOMAIN_NAME}"
# Write the data to the file
echo "${DATA}" > "${FILE_PATH}/${FILE_NAME}"
FILE_NAME="me"
# Define the data to write
DATA="${DOMAIN_NAME}"
# Write the data to the file
echo "${DATA}" > "${FILE_PATH}/${FILE_NAME}"
echo "Domains added to host_list file"

#create nginx reverse proxy for ip by using following code and create ssl for that domain
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
FILE_PATH="/etc/nginx/sites-available"
FILE_NAME="link.${DOMAIN_NAME}"
# Define the data to write
DATA="server {
 #   listen 80;
 server_name  link.${DOMAIN_NAME};

        location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
        }

}"
# Write the data to the file
echo "${DATA}" > "${FILE_PATH}/${FILE_NAME}"
echo "created nginx reverse proxy for ip and domain"
#short link the config file for nginx
echo "creating shortlink for nginx files"
ln -s /etc/nginx/sites-available/link.${DOMAIN_NAME} /etc/nginx/sites-enabled/
#ssl certificate to domain
echo "creating ssl for domains"
sudo certbot --nginx -d link.${DOMAIN_NAME} --redirect
echo "Done creating ssl for domains"

#do this for main domain
echo "copy the keyfiles for domain"
cp -r /etc/letsencrypt/archive/link.${DOMAIN_NAME}/cert1.pem /var/mail-server/config/cert1.pem
cp -r /etc/letsencrypt/archive/link.${DOMAIN_NAME}/privkey1.pem /var/mail-server/config/privkey1.pem
#update package.json file in Haraka:
cp -r /var/shell-scripts/package.js /root/.nvm/versions/node/v16.20.0/lib/node_modules/Haraka/package.json
cd /root/.nvm/versions/node/v16.20.0/lib/node_modules/Haraka/
npm i
#Create DKIM, DMARC, SPF records for your domains
echo "creating DKIM, DMARC, SPF records"
cd /var/mail-server/config/dkim
chmod +x dkim_key_gen.sh
#run the following command for every domain
./dkim_key_gen.sh ${DOMAIN_NAME}
cat ${DOMAIN_NAME}/dns
