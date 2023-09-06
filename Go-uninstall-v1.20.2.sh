##############10.go uninstallation:
# Check if Go is installed
if command -v go &>/dev/null; then
    echo "Go is installed. Uninstalling Go..."
    # Uninstall Go
    sudo rm -rf "$(which go)"
    sudo rm -rf /usr/local/go
    sudo rm -rf /etc/paths.d/go
    echo "Go uninstalled successfully."
else
    echo "Go not found. Need to install Go."
fi
