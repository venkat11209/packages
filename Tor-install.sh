#################13.Tor-installation
FILE_PATH="/etc/tor/torrc"
Domain=thefavlink.com
Name=ve
email='"<address@email.com>"'

if [ -x "$(command -v tor)" ]; then
    echo "Tor is already installed."
    
  else
    echo "Tor is not found.installing Tor..."
    sudo wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --import
    sudo gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
    apt update
    apt install tor -y
    sudo apt-get install obfs4proxy
    
# Define the data to write
DATA="BridgeRelay 1

# Replace "TODO1" with a Tor port of your choice.
# This port must be externally reachable.
# Avoid port 9001 because it's commonly associated with Tor and censors may be scanning the Internet for this port.
ORPort 10001

ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy

# Replace "TODO2" with an obfs4 port of your choice.
# This port must be externally reachable and must be different from the one specified for ORPort.
# Avoid port 9001 because it's commonly associated with Tor and censors may be scanning the Internet for this port.
ServerTransportListenAddr obfs4 0.0.0.0:10002

# Local communication port between Tor and obfs4.  Always set this to "auto".
# "Ext" means "extended", not "external".  Don't try to set a specific port number, nor listen on 0.0.0.0.
ExtORPort auto

# Replace "${email}" with your email address so we can contact you if there are problems with your bridge.
# This is optional but encouraged.
ContactInfo info@"${Domain}"

# Pick a nickname that you like for your bridge.  This is optional.
Nickname $Name"

# Write the data to the file
echo "${DATA}" > "${FILE_PATH}"

# Write the data to the file
echo "${DATA}" > "${FILE_PATH}"
sed -i -e 's/NoNewPrivileges=yes/NoNewPrivileges=no/g' /lib/systemd/system/tor@default.service
sed -i -e 's/NoNewPrivileges=yes/NoNewPrivileges=no/g' /lib/systemd/system/tor@.service
systemctl daemon-reload
systemctl enable --now tor.service
systemctl restart tor.service
systemctl status tor.service
echo "Tor installed successfully."
journalctl -e -u tor@default

fi