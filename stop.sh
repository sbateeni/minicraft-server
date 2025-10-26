#!/bin/bash
echo "Stopping Minecraft server..."
printf "stop\n" | nc localhost 25565
echo "Server stop command sent."
sleep 5