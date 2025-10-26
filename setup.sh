#!/bin/bash

echo "========================================"
echo "Minecraft Server Initial Setup"
echo "========================================"
echo
echo "This script will help you set up your Minecraft server."
echo

# Check if Java is installed
if command -v java &> /dev/null; then
    echo "Java is installed."
    JAVA_VERSION=$(java -version 2>&1 | head -n1 | cut -d'"' -f2)
    echo "Java version: $JAVA_VERSION"
    
    # Extract major version number
    JAVA_MAJOR=$(echo "$JAVA_VERSION" | cut -d'.' -f1 | sed 's/[^0-9]*//g')
    if [ "$JAVA_MAJOR" = "1" ]; then
        JAVA_MAJOR=$(echo "$JAVA_VERSION" | cut -d'.' -f2)
    fi
    
    # Check if Java version is sufficient (need Java 17+)
    if [ "$JAVA_MAJOR" -lt 17 ]; then
        echo
        echo "WARNING: Minecraft server requires Java 17 or higher."
        echo "You are currently using Java $JAVA_MAJOR."
        echo
        echo "Please download and install Java 17 or higher from:"
        echo "https://adoptium.net/"
        echo
        echo "For Termux, use: pkg install openjdk-17"
        echo
    fi
else
    echo "ERROR: Java is not installed or not in PATH."
    echo "Please install Java 17 or higher and try again."
    echo "For Termux: pkg install openjdk-17"
    exit 1
fi

echo
echo "Starting Minecraft server for initial setup..."
echo "This will generate configuration files."
echo
read -p "Press Enter to continue..."

java -Xmx2G -Xms1G -jar server.jar nogui

echo
echo "Server setup files generated."
echo

# Check for EULA
if [ -f "eula.txt" ]; then
    echo "Checking EULA..."
    if grep -q "eula=false" eula.txt; then
        echo
        echo "You need to accept the Minecraft EULA to run the server."
        echo "Opening eula.txt in editor..."
        sleep 3
        
        # Try different editors based on environment
        if command -v nano &> /dev/null; then
            nano eula.txt
        elif command -v vim &> /dev/null; then
            vim eula.txt
        else
            cat eula.txt
            echo
            echo "Please edit the file to change 'eula=false' to 'eula=true'"
        fi
        
        echo
        echo "Please change 'eula=false' to 'eula=true' in the file and save it."
        echo "After saving, run ./start.sh to start your server."
        echo
    else
        echo "EULA already accepted."
        echo "You can now run ./start.sh to start your server."
    fi
else
    echo "EULA file not found. Run the server once more to generate it."
fi

echo
echo "Setup complete!"