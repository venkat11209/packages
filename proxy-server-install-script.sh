###Proxy server installation and configuration 
##Create instance

sudo apt update
sudo apt install squid


sudo mkdir /etc/squid/squid_instance1
sudo mkdir /etc/squid/squid_instance2
# ... and so on for as many instances as you need.

sudo cp /etc/squid/squid.conf /etc/squid/squid_instance1/squid.conf
sudo cp /etc/squid/squid.conf /etc/squid/squid_instance2/squid.conf

Create file to manage each squid instance easily and ensure they start on boot
/etc/systemd/system/squid_instance1.service

[Unit]
Description=Squid_instance_1
After=network.target

[Service]
ExecStart=/usr/sbin/squid -f /etc/squid/squid_instance1/squid.conf -NYCd 1
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/bin/kill -TERM $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target

Save the file and repeat for all instances

First stop the squid file which is running
sudo  systemctl stop squid.service

sudo systemctl enable squid_instance1
sudo systemctl start squid_instance1

sudo apt-get update
sudo apt-get install dante-server


##config file parameters

tcp_outgoing_address 103.159.247.1
acl Safe_ports port 8001
pid_filename /var/run/squid_instance1.pid
access_log /var/log/squid/instance1_access.log
cache_log /var/log/squid/instance1_cache.log
http_port 103.159.247.1:8001
http_access allow Safe_ports

# Bandwidth limitng
# Example bandwidth limiting
delay_pools 1
delay_class 1 1
delay_access 1 allow Safe_ports
delay_parameters 1 20000/20000   # 20 kbits per second

cache_dir null /tmp
cache deny all
