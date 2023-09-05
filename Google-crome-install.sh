##################14.Google-chrome installation:
#check Google-crome is installed
if dpkg -s google-chrome-stable &> /dev/null; then
    echo "Google Chrome is installed."
    
else
    echo "Google Chrome is not found.installing Google-crome..."
   apt-get update
   apt-get -y install xvfb xorg xvfb dbus-x11 xfonts-100dpi xfonts-75dpi xfonts-cyrillic --fix-missing
 #chrome will use this to run headlessly
apt-get -y install unzip --fix-missing


# install dbus - chromedriver needs this to talk to google-chrome
apt-get -y install dbus --fix-missing
apt-get -y install dbus-x11 --fix-missing
# if bellow dbus-daemon file already exist leave these commands
ln -s /bin/dbus-daemon /usr/bin/dbus-daemon     # /etc/init.d/dbus has the wrong location
ln -s /bin/dbus-uuidgen /usr/bin/dbus-uuidgen   # /etc/init.d/dbus has the wrong location

# install chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get update
apt-get -y install google-chrome-stable

# install chromedriver
# NOTE: check google version and download similar newer version.
google-chrome --version
wget -N http://chromedriver.storage.googleapis.com/111.0.5563.64/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv -f chromedriver /usr/local/bin/
    echo "Google Chrome installed successfully."
fi