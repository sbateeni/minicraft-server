@echo off
title Minecraft Server Setup

echo ========================================
echo Minecraft Server Initial Setup
echo ========================================
echo.
echo This script will help you set up your Minecraft server.
echo.

:check_java
java -version >nul 2>&1
if %errorlevel% == 0 (
    echo Java is installed.
    for /f "tokens=3" %%g in ('java -version 2^>^&1 ^| findstr /i "version"') do (
        set JAVA_VERSION=%%g
    )
    echo Java version: %JAVA_VERSION%
    
    REM Check if Java version is sufficient (need Java 17+)
    for /f "tokens=2 delims=." %%v in ("%JAVA_VERSION%") do (
        set JAVA_MAJOR=%%v
    )
    if %JAVA_MAJOR% LSS 17 (
        echo.
        echo WARNING: Minecraft server requires Java 17 or higher.
        echo You are currently using Java %JAVA_MAJOR%.
        echo.
        echo Please download and install Java 17 or higher from:
        echo https://adoptium.net/
        echo.
        echo After installation, you may need to restart your computer.
        echo.
        pause
    )
) else (
    echo ERROR: Java is not installed or not in PATH.
    echo Please install Java 17 or higher and try again.
    echo Download from: https://adoptium.net/
    pause
    exit /b 1
)

echo.
echo Starting Minecraft server for initial setup...
echo This will generate configuration files.
echo.
pause

java -Xmx2G -Xms1G -jar server.jar nogui

echo.
echo Server setup files generated.
echo.

:check_eula
if exist eula.txt (
    echo Checking EULA...
    findstr /C:"eula=false" eula.txt >nul
    if %errorlevel% == 0 (
        echo.
        echo You need to accept the Minecraft EULA to run the server.
        echo Opening eula.txt in Notepad...
        timeout /t 3 >nul
        notepad eula.txt
        echo.
        echo Please change "eula=false" to "eula=true" in the file and save it.
        echo After saving, run this script again or start.bat directly.
        echo.
    ) else (
        echo EULA already accepted.
        echo You can now run start.bat to start your server.
    )
) else (
    echo EULA file not found. Run the server once more to generate it.
)

echo.
echo Setup complete!
echo.
pause