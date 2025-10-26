@echo off
title Minecraft Server Update

echo ========================================
echo Minecraft Server Update
echo ========================================
echo.
echo This script will update your Minecraft server to the latest version.
echo WARNING: Always backup your world before updating!
echo.
echo 1. Backup your current world (recommended)
echo 2. Download the latest server.jar
echo 3. Replace the existing server.jar
echo.
choice /C YN /M "Do you want to continue with the update"
if errorlevel 2 goto :eof

echo.
echo Creating backup...
call backup.bat

echo.
echo Downloading latest server.jar...
REM This would normally download from the official source
REM For now, we'll just note that the user needs to manually download
echo Please download the latest server.jar from:
echo https://www.minecraft.net/en-us/download/server
echo Replace the existing server.jar with the new one
echo.

pause