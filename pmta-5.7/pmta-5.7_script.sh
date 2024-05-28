######## PMTA-5.7 INSTALLATION AND CONFIGURATION SCRIPT ############
### ADD YOUR DOMAIN DETAILS HERE
DOMAIN="shadowproperties.co"

### ADD YOUR IP'S HERE
IP_1="103.166.221.40"
IP_2="103.166.221.41"
IP_3="103.166.221.42"
IP_4="103.166.221.43"
IP_5="103.166.221.44"

####Step1: - Required packages installation:
yum -y update
yum install git
yum update -y --skip-broken
yum -y --skip-broken reinstall polkit
yum install -y --skip-broken sudo openssh-clients gdb nano wget httpd mod_ssl zip unzip yum-utils cronie perl
cd /opt/
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget https://fr2.rpmfind.net/linux/remi/enterprise/remi-release-7.rpm
rpm -Uvh epel-release-latest-7.noarch.rpm
rpm -Uvh remi-release-7.rpm
yum install -y --skip-broken php php-mcrypt php-cli php-gd php-curl php-pgsql php-mysql php-ldap php-zip php-fileinfo php-common php-pdo php-mbstring php-soap php-zip php-xmlrpc php-opcache
systemctl restart httpd &&  systemctl enable httpd
systemctl restart sshd
yum install -y libopendkim-devel opendkim

####Step3: - Generate dkim keys manually :
cd /etc/opendkim/keys/
mkdir $DOMAIN
cd $DOMAIN
openssl genrsa -out private.key 2048
openssl rsa -in private.key -pubout -out public.key


####Step5: - Install and configure the pmta:
cd /opt/shell-scripts/pmta-5.7
rpm -Uvh pmta64.rpm
rm -rf /etc/pmta/config
mv /opt/shell-scripts/pmta-5.7/config /etc/pmta/
mv /opt/shell-scripts/pmta-5.7/license /etc/pmta/

#Update your domain in config file
sed -i "s/domain_name/$DOMAIN/g" /etc/pmta/config
#Update your IP'S in config file
sed -i "s/ip_1/$IP_1/g" /etc/pmta/config
sed -i "s/ip_2/$IP_2/g" /etc/pmta/config
sed -i "s/ip_3/$IP_3/g" /etc/pmta/config
sed -i "s/ip_4/$IP_4/g" /etc/pmta/config
sed -i "s/ip_5/$IP_5/g" /etc/pmta/config

chown pmta.pmta /etc/pmta/config
chown pmta.pmta /etc/pmta/license
mv /usr/sbin/pmtad /usr/sbin/pmtad1
mv /opt/shell-scripts/pmta-5.7/pmtad /usr/sbin/
sudo chmod +x /usr/sbin/pmtad
sudo /usr/sbin/pmtad

#Restart pmta services
service pmta stop
service pmta restart
service pmta status

#disable the firewall
systemctl stop firewalld
systemctl disable firewalld
systemctl status firewalld

#set server hostname
hostnamectl set-hostname mail.$DOMAIN

#reboot the server
reboot


