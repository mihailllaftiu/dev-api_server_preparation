# Set colors for better readability
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo "${ORANGE}------------------------------------${NC}"
echo "${ORANGE}  Enhancing Web Server Performance and Features   ${NC}"
echo "${ORANGE}------------------------------------${NC}\n"

# Update package lists
echo "${ORANGE}Updating package lists...${NC}"
sudo apt update -y
sudo apt upgrade -y
echo "${ORANGE}Package lists updated.${NC}\n"

# Install essential tools for web development
echo "${ORANGE}Installing essential tools for web development...${NC}"
sudo apt install nano vim curl git composer -y
echo "${ORANGE}Essential tools for web development installed.${NC}\n"

# Install performance optimization tools
echo "${ORANGE}Installing performance optimization tools...${NC}"
sudo apt install htop btop npm php-xdebug php-codesniffer phpunit -y
echo "${ORANGE}Performance optimization tools installed.${NC}\n"

# Install Let's Encrypt for automated certificate renewal
echo "${ORANGE}Installing Let's Encrypt for automated certificate renewal...${NC}"
sudo apt install certbot -y
echo "${ORANGE}Let's Encrypt installed.${NC}\n"

# Restart web servers
echo "${ORANGE}Restarting web servers...${NC}"
sudo apt autoremove -y
sudo service apache2 restart
echo "${ORANGE}Web servers restarted.${NC}\n"

echo "${ORANGE}--------------------------------------${NC}"
echo "${ORANGE}  Web Server Enhancement Completed!     ${NC}"
echo "${ORANGE}--------------------------------------${NC}\n"
