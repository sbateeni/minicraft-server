@echo off
echo Stopping Minecraft server...
echo stop | nc localhost 25565
echo Server stop command sent.
timeout /t 5