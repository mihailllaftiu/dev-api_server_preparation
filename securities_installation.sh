# Set colors for better readability
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo "${ORANGE}-------------------------------------------${NC}"
echo "${ORANGE}  Enhanced Server Security Configuration   ${NC}"
echo "${ORANGE}-------------------------------------------${NC}\n"

# Update package lists
echo "${ORANGE}Updating package lists...${NC}"
sudo apt update
echo "${ORANGE}Package lists updated.${NC}\n"

# Install Uncomplicated Firewall (UFW)
echo "${ORANGE}Installing Uncomplicated Firewall (UFW)...${NC}"
sudo apt install ufw -y
echo "${ORANGE}UFW installed.${NC}\n"

# Set default firewall rules
echo "${ORANGE}Configuring default firewall rules...${NC}"
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow OpenSSH
sudo ufw allow in "Apache Full"
sudo ufw enable
sudo systemctl restart apache2
echo "${ORANGE}Configured basic firewall rules.${NC}\n"

# Enable UFW rate limiting for DoS/DDoS protection
echo "${ORANGE}Configuring UFW rate limiting for DoS/DDoS protection...${NC}"
sudo ufw limit ssh
echo "${ORANGE}UFW rate limiting enabled.${NC}\n"

# Enable automatic security updates
echo "${ORANGE}Enabling automatic security updates...${NC}"
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure -plow unattended-upgrades
echo "${ORANGE}Automatic security updates enabled.${NC}\n"

# Install fail2ban for protection against brute-force attacks
echo "${ORANGE}Installing fail2ban for protection against brute-force attacks...${NC}"
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
echo "${ORANGE}fail2ban installed and enabled.${NC}\n"

# Install ClamAV antivirus
echo "${ORANGE}Installing ClamAV antivirus...${NC}"
sudo apt install clamav clamav-daemon -y
sudo freshclam  # Update ClamAV definitions

# Add clamav user if not already added
if ! grep -q "^clamav" /etc/passwd; then
    sudo useradd -r -s /usr/sbin/nologin clamav
fi

sudo systemctl enable clamav-freshclam
sudo systemctl start clamav-freshclam
echo "${ORANGE}ClamAV installed and updated.${NC}\n"

# Install ModSecurity for Apache
echo "${ORANGE}Installing ModSecurity for Apache...${NC}"
sudo apt install libapache2-mod-security2 -y
sudo cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf
sudo ln -s /usr/share/modsecurity-crs /etc/apache2/modsecurity-crs
sudo systemctl restart apache2
echo "${ORANGE}ModSecurity installed.${NC}\n"

echo "${ORANGE}-------------------------------------------${NC}"
echo "${ORANGE}  Enhanced Server Security Complete!       ${NC}"
echo "${ORANGE}-------------------------------------------${NC}\n"
