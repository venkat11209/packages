#############4.postgresql uninstallation:
if [ -x "$(command -v psql)" ]; then
    echo "PostgreSQL is already installed. Uninstalling posgresql..."
    # Uninstall PostgreSQL
    sudo apt-get purge -y postgresql\*
    sudo rm -rf /etc/postgresql/
    sudo rm -rf /var/lib/postgresql/
    echo "PostgreSQL has been uninstalled."
else
    echo "PostgreSQL not found.need to install postgresql"
fi

# Check if PostgreSQL client is installed
if [ -x "$(command -v psql)" ]; then
    echo "PostgreSQL client is already installed. Uninstalling postgresql-client..."
    # Uninstall PostgreSQL client
    sudo apt-get purge -y postgresql-client\*
    echo "PostgreSQL client has been uninstalled."
else
    echo "PostgreSQL client not found.need to install postgresql-client."
fi
