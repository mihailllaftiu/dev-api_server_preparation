---
## Table of Contents 📌
1. [Introduction](#introduction-)
2. [Requirements](#requirements-)
3. [Suggestions Installation](#suggestions-installation-%EF%B8%8F)
4. [LAMP Installation](#lamp-installation-%EF%B8%8F)
5. [Security Installation](#security-installation-%EF%B8%8F)
6. [Running Process](#running-process-%EF%B8%8F)
7. [Conclusion](#conclusion-)
<br><br><br>
---

## Introduction 📋
This script automates the ```setup process for a DEV / API server```, covering suggestions for **optimizations**, **LAMP stack** installation, and **security configurations**. 
<br><br><ins>*There will be **LEMP Stack** installation soon..*</ins>

## Requirements 📝

| **What it Requires (At least)** | **What it Offers (Ready to Play)** |
|--------------------------------|-----------------------------|
| **OS:**  Ubuntu 22.04 (Required)   | **PHP:**           8.1          |
| **RAM:** 8GB + (recommended)       | **Database (DB):** MariaDB 10.6 |
| **CPU:** 4+ (recommended)          | **Web Server:**    Apache 2.4   |


## Suggestions Installation 🧰

The 'Suggestions Installation' section enhances server performance and reliability through the following steps:

- **Performance Optimizations:** Fine-tuning various system settings for improved performance.
- **Service Optimization:** Optimizing services and configurations to enhance overall efficiency.
- **Best Practices Implementation:** Implementing server best practices to ensure reliable performance.
  
This section focuses on fine-tuning system settings, optimizing service configurations, and implementing best practices to guarantee efficient and reliable server operation. It encompasses aspects such as:

```bash
# Additional Specifications
- Resource utilization enhancements.
- Caching mechanisms implementation.
- Service-specific optimizations for improved performance.
```


## LAMP Installation 🖥️

The 'LAMP Installation' section is responsible for setting up the foundational components necessary for hosting web applications, such as Linux, Apache, MySQL, and PHP. This process includes the following steps:

- **Apache Installation:** Installs the Apache web server, ensuring a robust foundation for web hosting.
- **MariaDB Installation:** Installs the MariaDB database server, setting up the database component.
- **PHP Installation:** Installs PHP and essential extensions required for dynamic content handling.
- **PHP Configuration Optimizations:** Fine-tunes PHP configurations for optimized performance.

This comprehensive setup ensures the compatibility and seamless operation of essential web services. It establishes a solid environment for hosting various web applications, optimizing performance and reliability while ensuring efficient database and server functioning. Additionally, this setup implements various enhancements:

```bash
# Additional Specifications
- Apache Configuration: Enables Apache to start on system startup and ensures it starts promptly.
- MariaDB Security: Executes the MySQL secure installation process to enhance database security.
- PHP-FPM Configuration: Configures PHP-FPM, ensuring it starts on system startup for fast PHP processing.
- HTTP/2 Module Enablement: Activates the HTTP/2 module for improved web server performance.
```



## Security Installation 🛡️

The 'Security Installation' section focuses on enhancing server security measures and configurations. This process encompasses several steps:

- **Automatic Security Updates:** Enables automatic security updates to ensure the system is up-to-date with the latest security patches.
- **Brute-force Protection:** Installs fail2ban, providing protection against brute-force attacks by monitoring system logs and banning suspicious IP addresses.
- **Web Application Firewall (WAF):** Installs ModSecurity for Apache, enhancing web server security by deploying an application layer firewall.

These measures collectively fortify the server against potential security threats, ensuring a more secure environment. They include setting up firewalls, implementing DoS/DDoS protection, enabling automatic security updates, safeguarding against brute-force attacks, deploying antivirus protection, and establishing a web application firewall to enhance server security with configurations of:

```bash
# Additional Specifications
- Firewall Configuration: Installs and configures the Uncomplicated Firewall (UFW), setting up default and specific firewall rules to regulate incoming and outgoing traffic.
- DoS/DDoS Protection: Enables UFW rate limiting to mitigate potential Denial of Service (DoS) or Distributed Denial of Service (DDoS) attacks, particularly for SSH connections.
- Antivirus Setup: Installs and sets up ClamAV antivirus for malware detection, including regular updates for virus definitions.
```
<br><br>

---

## Running Process 🛠️
To set up the environment for installation:

**Git Installation:** In case the OS of your server won't have pre-installed the 'git'.
```bash
sudo apt-get install git -y
```

**Clone Repo:** Run the following command to create a directory and clone the repository.
```bash
sudo git clone https://github.com/mihailllaftiu/dev-api_server_preparation.git /dev-api_server_preparation
```

**Navigate to the Directory:** Move into the newly created 'tools' directory.
```bash
cd /dev-api_server_preparation/apache
```

**Run Installation:** Run the installation 'sh' file and begin the process.
```bash
sh prepare_installation.sh
```

## Conclusion 💡
Upon execution, these scripts collectively automate the setup process for the server, covering suggestions for optimizations, LAMP stack installation, and security configurations, ensuring a **well-optimized** and **secure** environment for hosting applications.
