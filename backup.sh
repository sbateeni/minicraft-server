#!/bin/bash

echo "========================================"
echo "Minecraft World Backup"
echo "========================================"

# Create backups directory if it doesn't exist
if [ ! -d "backups" ]; then
    mkdir backups
fi

# Get current date and time for backup filename
datestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Create backup
echo "Creating backup: backups/world_backup_$datestamp.tar.gz"
tar -czf "backups/world_backup_$datestamp.tar.gz" world

echo "Backup completed!"