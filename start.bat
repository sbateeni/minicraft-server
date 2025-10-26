@echo off
title Minecraft Server

echo ========================================
echo Starting Minecraft Server...
echo ========================================

REM Check Java version
echo Checking Java version...
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
    echo ERROR: Minecraft server requires Java 17 or higher.
    echo You are currently using Java %JAVA_MAJOR%.
    echo.
    echo Please download and install Java 17 or higher from:
    echo https://adoptium.net/
    echo.
    echo After installation, you may need to restart your computer.
    echo.
    pause
    exit /b 1
)

REM Check if eula.txt exists and is accepted
if exist eula.txt (
    findstr /C:"eula=true" eula.txt >nul
    if %errorlevel% neq 0 (
        echo.
        echo ERROR: You need to accept the EULA first.
        echo Please edit eula.txt and change "eula=false" to "eula=true"
        echo.
        pause
        exit /b 1
    )
) else (
    echo.
    echo ERROR: eula.txt not found.
    echo Please run setup.bat first.
    echo.
    pause
    exit /b 1
)

REM Start the server with optimized settings
echo Starting server with 2GB RAM allocation...
java -Xmx2G -Xms1G ^
-XX:+UseG1GC ^
-XX:+UnlockExperimentalVMOptions ^
-XX:+DisableExplicitGC ^
-XX:+AlwaysPreTouch ^
-XX:MaxGCPauseMillis=50 ^
-XX:G1HeapRegionSize=4M ^
-XX:G1NewSizePercent=30 ^
-XX:G1MaxNewSizePercent=40 ^
-XX:G1MixedGCCountTarget=8 ^
-XX:G1MixedGCLiveThresholdPercent=90 ^
-XX:G1RSetUpdatingPauseTimePercent=5 ^
-XX:SurvivorRatio=32 ^
-XX:+PerfDisableSharedMem ^
-XX:G1SATBBufferEnqueueingThresholdPercent=30 ^
-XX:G1ConcRSHotCardLimit=16 ^
-XX:G1ConcRefinementServiceIntervalMillis=150 ^
-jar server.jar nogui

pause