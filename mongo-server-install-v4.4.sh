###############2(i).mongo-db installation(old version):
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
	echo "mongo user and roles creating...."
    echo "db.createUser( { user:'esnuke' , pwd:'Es-nuke2k21',roles: [ { role: 'root', db: 'admin' } ]})" | sudo mongo admin
    echo "db.auth('esnuke','Es-nuke2k21')" | sudo mongo admin
    #sudo sh -c 'echo "security:\n  authorization: enabled" >> /etc/mongod.conf'
    echo "User created successfully."
    # Set the path to the mongod.conf file
    sudo sh -c 'echo "security:\n  authorization: enabled" >> /etc/mongod.conf'
    systemctl stop mongod
    systemctl restart mongod
   
else
    echo "mongo is already installed"
fi
