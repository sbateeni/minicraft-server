# Minecraft Server Setup

This directory contains all the necessary files to run a Minecraft server.

## Prerequisites

- Java 17 or higher installed on your system (Java 8 will not work)
- At least 2GB of RAM available

## Java Installation

### For Windows:
1. Download Java 17 or higher from [Adoptium](https://adoptium.net/)
2. Install the downloaded package
3. Restart your computer if necessary

### For Linux/Termux:
```bash
# For Termux on Android
pkg install openjdk-17

# For Ubuntu/Debian
sudo apt install openjdk-17-jre

# For CentOS/RHEL
sudo yum install java-17-openjdk
```

## Files Included

- `server.jar` - The Minecraft server executable (version 1.21.10)
- `start.bat` - Windows batch script to start the server
- `start.sh` - Linux/Termux shell script to start the server
- `setup.bat` - Windows batch script for initial setup
- `setup.sh` - Linux/Termux shell script for initial setup
- `stop.bat` - Windows batch script to stop the server
- `stop.sh` - Linux/Termux shell script to stop the server
- `backup.bat` - Windows batch script to backup world data
- `backup.sh` - Linux/Termux shell script to backup world data
- `server.properties` - Main server configuration file
- `eula.txt` - End User License Agreement
- `performance-tuning.txt` - Performance optimization tips

## Initial Setup

1. **Run Setup Script**: 
   - Windows: Double-click `setup.bat`
   - Linux/Termux: Run `chmod +x setup.sh` then `./setup.sh`

2. The setup script will check for Java and start the server to generate configuration files

3. The server will stop and open `eula.txt` for you to accept the EULA

4. Change `eula=false` to `eula=true` in `eula.txt` and save the file

## Running the Server

### On Windows:
Double-click the `start.bat` file or run in Command Prompt:
```
start.bat
```

### On Linux/Termux:
Make the script executable and run:
```bash
chmod +x start.sh
./start.sh
```

## Stopping the Server

To stop the server gracefully (important to prevent world corruption):

### On Windows:
Double-click the `stop.bat` file or run in Command Prompt:
```
stop.bat
```

### On Linux/Termux:
Make the script executable and run:
```bash
chmod +x stop.sh
./stop.sh
```

## Backing Up Your World

Regular backups are essential to protect your world data:

### On Windows:
Double-click the `backup.bat` file

### On Linux/Termux:
Make the script executable and run:
```bash
chmod +x backup.sh
./backup.sh
```

Backups are stored in the `backups` directory.

## Configuration

- `server.properties` - Main server configuration file
- `eula.txt` - End User License Agreement
- `ops.json` - Server operators list
- `whitelist.json` - Player whitelist
- `banned-players.json` - Banned players list
- `banned-ips.json` - Banned IP addresses

## Customization

You can modify `server.properties` to change server settings:
- `server-port` - Change the port the server runs on (default: 25565)
- `max-players` - Maximum number of players (default: 20)
- `difficulty` - Game difficulty (peaceful, easy, normal, hard)
- `gamemode` - Default game mode (survival, creative, adventure, spectator)
- `level-name` - Name of the world
- `motd` - Message of the day (server description)

## Performance Tuning

See `performance-tuning.txt` for advanced JVM optimization flags that can improve server performance.

The start scripts already include optimized JVM flags for better performance.

## Connecting to Your Server

After starting the server, players can connect using:
- `localhost` or `127.0.0.1` if connecting from the same machine
- Your local IP address if connecting from another device on the same network
- Your public IP address if you've set up port forwarding

## Port Forwarding

To allow external players to connect, you'll need to:
1. Forward port 25565 (or your custom port) on your router
2. Ensure Windows Firewall allows Java or the specific port

## System Requirements

- Minimum: 2GB RAM (1GB allocated to server)
- Recommended: 4GB+ RAM for better performance

## Multi-Platform Compatibility

This setup works on both Windows and Linux/Termux environments:
- For Termux on Android, install Java with: `pkg install openjdk-17`
- All scripts are provided in both Windows (.bat) and Unix (.sh) formats