###############4.postgresql and postgresql-clint installation:
# Check if PostgreSQL and PostgreSQL client are already installed
if [ -x "$(command -v psql)" ] && [ -x "$(command -v pg_isready)" ]; then
    echo "PostgreSQL and PostgreSQL client are already installed."
    exit 0
fi

# Install PostgreSQL and PostgreSQL client
echo "postgresql and postgresql-client installing...."
sudo apt-get update
sudo apt-get install -y postgresql postgresql-client

# Check the installation status
if [ $? -eq 0 ]; then
    echo "PostgreSQL and PostgreSQL client installed successfully."
else
    echo "Failed to install PostgreSQL and PostgreSQL client."
fi