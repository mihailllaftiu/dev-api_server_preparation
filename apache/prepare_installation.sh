#!/bin/bash

# Run suggestions installation script
echo "Running suggestions installation script..."
sh suggestions_installation.sh

# Run LAMP installation script
echo "Running LAMP installation script..."
sh lamp_installation.sh

# Run security installation script
echo "Running security installation script..."
sh securities_installation.sh

echo "Startup scripts executed."