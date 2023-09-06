##################13.zabbix-agent uninstallation:
#check zabbix-agent is installed
if [ -x "$(command -v zabbix_agentd)" ]; then
    echo "zabbix-agent is installed. Uninstalling zabbix-agent..."
    # Uninstall zabbix-agent
    sudo systemctl stop zabbix-agent
    sudo apt-get remove zabbix-agent -y
    echo "zabbix-agent uninstalled successfully."
else
    echo "zabbix-agent not found.need to install zabbix-agent."
fi
