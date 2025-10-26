#!/bin/bash

echo "========================================"
echo "Starting Minecraft Server..."
echo "========================================"

# Check Java version
echo "Checking Java version..."
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
    echo "ERROR: Minecraft server requires Java 17 or higher."
    echo "You are currently using Java $JAVA_MAJOR."
    echo
    echo "Please download and install Java 17 or higher from:"
    echo "https://adoptium.net/"
    echo
    echo "For Termux, use: pkg install openjdk-17"
    echo
    exit 1
fi

# Check if eula.txt exists and is accepted
if [ -f "eula.txt" ]; then
    if ! grep -q "eula=true" eula.txt; then
        echo
        echo "ERROR: You need to accept the EULA first."
        echo "Please edit eula.txt and change \"eula=false\" to \"eula=true\""
        echo
        exit 1
    fi
else
    echo
    echo "ERROR: eula.txt not found."
    echo "Please run ./setup.sh first."
    echo
    exit 1
fi

# Start the server with optimized settings
echo "Starting server with 2GB RAM allocation..."
java -Xmx2G -Xms1G \
-XX:+UseG1GC \
-XX:+UnlockExperimentalVMOptions \
-XX:+DisableExplicitGC \
-XX:+AlwaysPreTouch \
-XX:MaxGCPauseMillis=50 \
-XX:G1HeapRegionSize=4M \
-XX:G1NewSizePercent=30 \
-XX:G1MaxNewSizePercent=40 \
-XX:G1MixedGCCountTarget=8 \
-XX:G1MixedGCLiveThresholdPercent=90 \
-XX:G1RSetUpdatingPauseTimePercent=5 \
-XX:SurvivorRatio=32 \
-XX:+PerfDisableSharedMem \
-XX:G1SATBBufferEnqueueingThresholdPercent=30 \
-XX:G1ConcRSHotCardLimit=16 \
-XX:G1ConcRefinementServiceIntervalMillis=150 \
-jar server.jar nogui