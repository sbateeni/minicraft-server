#!/bin/bash

echo "========================================"
echo "Minecraft Server Update"
echo "========================================"
echo
echo "This script will update your Minecraft server to the latest version."
echo "WARNING: Always backup your world before updating!"
echo
echo "1. Backup your current world (recommended)"
echo "2. Download the latest server.jar"
echo "3. Replace the existing server.jar"
echo

read -p "Do you want to continue with the update? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

echo
echo "Creating backup..."
./backup.sh

echo
echo "Downloading latest server.jar..."
# This would normally download from the official source
# For now, we'll just note that the user needs to manually download
echo "Please download the latest server.jar from:"
echo "https://www.minecraft.net/en-us/download/server"
echo "Replace the existing server.jar with the new one"
echo

read -p "Press Enter to continue..."