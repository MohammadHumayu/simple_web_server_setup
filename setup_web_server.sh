#!/bin/bash

# Script to set up a simple Apache web server

# Function to print messages
print_message() {
    echo -e "\n========================================"
    echo -e "$1"
    echo -e "========================================\n"
}

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or using sudo."
    exit 1
fi

# Update the system
print_message "Updating the system packages"
dnf update -y

# Install Apache HTTP Server
print_message "Installing Apache HTTP Server"
dnf install -y httpd

# Start and enable Apache service
print_message "Starting and enabling Apache service"
systemctl start httpd
systemctl enable httpd

# Open the HTTP port in the firewall
print_message "Configuring firewall to allow HTTP traffic"
firewall-cmd --permanent --add-service=http
firewall-cmd --reload

# Create a custom HTML page
print_message "Setting up a custom web page"
cat <<EOL > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to My Web Server</title>
</head>
<body>
    <h1>Welcome!</h1>
    <p>This web server is successfully set up using an automated script.</p>
</body>
</html>
EOL

# Set proper permissions
print_message "Setting correct file permissions"
chown apache:apache /var/www/html/index.html
chmod 644 /var/www/html/index.html

# Check the status of Apache service
print_message "Verifying Apache service status"
systemctl status httpd | grep "Active:"

# Display the IP address for testing
IP=$(hostname -I | awk '{print $1}')
print_message "Web server setup complete!"
echo "You can access the web server at: http://$IP"

# End of script
exit 0
