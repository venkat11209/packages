#####################15.Zabbix-agent installation:
# Check if Zabbix agent is already installed
if [ -x "$(command -v zabbix_agentd)" ]; then
    echo "Zabbix agent is already installed."
else
    echo "Zabbix agent is not installed. Installing zabbix-agent..."
#Ubuntu 18.04:
#wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu18.04_all.deb
#dpkg -i zabbix-release_6.0-1+ubuntu18.04_all.deb

#Ubuntu 20.04:
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
apt-get update
sudo apt-get install zabbix-agent -y
sed -i -e 's/Server=127.0.0.1/Server=zabbix.fission.it,167.71.86.55/g' /etc/zabbix/zabbix_agentd.conf
sed -i -e 's/# ListenPort=10050/ListenPort=10050/g' /etc/zabbix/zabbix_agentd.conf
sed -i -e 's/# ListenIP=0.0.0.0/ListenIP=0.0.0.0/g' /etc/zabbix/zabbix_agentd.conf
sed -i -e 's/ServerActive=127.0.0.1/ServerActive=zabbix.fission.it,167.71.86.55/g' /etc/zabbix/zabbix_agentd.conf
sed -i -e 's/Hostname=Zabbix server/Hostname=hostname-of-agent-server/g' /etc/zabbix/zabbix_agentd.conf
sudo ufw allow 10050
systemctl restart zabbix-agent
systemctl enable zabbix-agent
zabbix_agentd -V

fi
