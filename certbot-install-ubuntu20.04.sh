#############11.certbot installation:
if ! command -v certbot &> /dev/null
then
    # Install certbot using npm
    echo "certbot not found. Installing certbot..."
    apt-get install certbot python3-certbot-nginx -y
else
    echo "certbot is already installed"
fi