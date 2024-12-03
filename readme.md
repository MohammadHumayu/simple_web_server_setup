# Simple Web Server Setup

This project automates the setup of a simple web server using Apache HTTP Server on a RHEL-based Linux distribution. It leverages a Bash script to streamline the installation, configuration, and deployment of a static webpage.

## Features
- Automated installation of Apache HTTP Server.
- Configures the firewall to allow HTTP traffic.
- Creates a custom HTML webpage.
- Sets up file permissions and ownership for secure hosting.
- Outputs the server's IP address for quick access.

## Prerequisites
- A RHEL-based Linux distribution (e.g., RHEL, CentOS, Fedora).
- Root or sudo privileges.
- Internet connection for package installation.

## How It Works
1. The Bash script updates the system and installs Apache HTTP Server.
2. Configures the firewall to allow HTTP (port 80) traffic.
3. Creates a custom HTML page and deploys it on the web server.
4. Displays the server's IP address for testing.

## Usage
1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/Simple-Web-Server-Setup.git
   cd Simple-Web-Server-Setup

2. Make the script executable:
    ```bash
    chmod +x setup_web_server.sh

3. Run the sript with sudo:
    ```bash
    sudo ./setup_web_server.sh

4. Access the hosted webpage in a browser