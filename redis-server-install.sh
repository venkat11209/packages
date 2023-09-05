###############3.redis-db installation:
PSW="sp-property@2k22"
# Check if redis is installed
if ! command -v redis-server &> /dev/null
then
    # Install redis-server
    echo "redis-server not found. Installing redis-server..."
    sudo apt install lsb-release
    curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
    sudo apt-get update
    sudo apt-get install redis-server -y
    sed -i 's/# requirepass foobared/requirepass '$PSW'/g' /etc/redis/redis.conf
    sed -i 's/bind 127.0.0.1 -::1/ bind * -::*/g' /etc/redis/redis.conf
    systemctl restart redis-server
    systemctl enable redis-server
else
    echo "redis-server is already installed"
fi