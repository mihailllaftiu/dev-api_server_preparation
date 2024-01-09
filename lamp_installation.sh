# Set colors for better readability
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo "${ORANGE}-------------------------------------------${NC}"
echo "${ORANGE}       LAMP Stack Installation Script      ${NC}"
echo "${ORANGE}-------------------------------------------${NC}\n"

# Install Apache web server
echo "${ORANGE}Installing Apache web server...${NC}"
sudo apt install apache2 -y
echo "${ORANGE}Apache installed.${NC}"

# Enable Apache service to start on system startup
echo "${ORANGE}Enabling Apache service to start on system startup...${NC}"
sudo systemctl enable apache2
echo "${ORANGE}Apache service enabled.${NC}"

# Start Apache service
echo "${ORANGE}Starting Apache service...${NC}"
sudo systemctl start apache2
echo "${ORANGE}Apache service started.${NC}"

# Install MariaDB database server
echo "${ORANGE}Installing MariaDB database server...${NC}"
sudo apt install mariadb-server mariadb-client -y
echo "${ORANGE}MariaDB installed.${NC}"

# Secure MariaDB database server
echo "${ORANGE}Securing MariaDB database server...${NC}"
echo -n "Enter the root password: "
stty -echo
read root_password
stty echo
echo
sudo mysql -u root -p$root_password -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$root_password');"
sudo mysql -u root -p$root_password -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
sudo mysql -u root -p$root_password -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -u root -p$root_password -e "DROP DATABASE IF EXISTS test;"
sudo mysql -u root -p$root_password -e "FLUSH PRIVILEGES;"
echo "${ORANGE}MariaDB secured.${NC}"

# Install PHP and required extensions
echo "${ORANGE}Installing PHP and required extensions...${NC}"
sudo apt install php php-mbstring php-mysql php-fpm php-gd php-curl php-xml php-memcached php-apcu -y
echo "${ORANGE}PHP and extensions installed.${NC}"

# Enable PHP-FPM service to start on system startup
echo "${ORANGE}Enabling PHP-FPM service to start on system startup...${NC}"
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php8.1-fpm
sudo systemctl enable php8.1-fpm
echo "${ORANGE}PHP-FPM service enabled.${NC}"

echo "${ORANGE}Optimize PHP configurations...${NC}"
php_versions=$(ls /etc/php/ | grep -v "cli-")
for version in $php_versions; do
    # Modify the configuration file
    ini_file="/etc/php/${version}/apache2/php.ini"
    sed -i -e "s/^max_execution_time =.*/max_execution_time = 600/" $ini_file
    sed -i -e "s/^max_input_time =.*/max_input_time = 600/" $ini_file
    sed -i -e "s/^memory_limit =.*/memory_limit = 512M/" $ini_file
    sed -i -e "s/^post_max_size =.*/post_max_size = 384M/" $ini_file
    sed -i -e "s/^upload_max_filesize =.*/upload_max_filesize = 128M/" $ini_file
    sed -i -e "s/^default_socket_timeout =.*/default_socket_timeout = 600/" $ini_file
done
echo "${ORANGE}PHP configurations optimized.${NC}"

# Start PHP-FPM service
echo "${ORANGE}Starting PHP-FPM service...${NC}"
sudo systemctl start php-fpm
echo "${ORANGE}PHP-FPM service started.${NC}"

# Enable HTTP/2 module
echo "${ORANGE}Enabling HTTP/2 module...${NC}"
sudo a2enmod http2
echo "${ORANGE}HTTP/2 module enabled.${NC}"

# Restart Apache to apply changes
echo "${ORANGE}Restarting Apache to apply changes for HTTP/2...${NC}"
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
echo "${ORANGE}Apache restarted.${NC}"

echo "\n${ORANGE}-------------------------------------------${NC}"
echo "${ORANGE}      LAMP Stack Installation Complete!    ${NC}"
echo "${ORANGE}-------------------------------------------${NC}\n"
