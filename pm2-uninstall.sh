##############9.pm2 uninstallation:
# Check if PM2 is installed
if command -v pm2 &> /dev/null; then
    echo "PM2 is installed.Uninstalling pm2..."

    # Uninstall PM2 using npm
    npm uninstall -g pm2

    echo "PM2 is uninstalled successfully."
else
    echo "PM2 not found.need to install pm2."
fi
