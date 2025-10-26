@echo off
title Minecraft World Backup

echo ========================================
echo Minecraft World Backup
echo ========================================

REM Create backups directory if it doesn't exist
if not exist backups mkdir backups

REM Get current date and time for backup filename
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

REM Create backup
echo Creating backup: backups\world_backup_%datestamp%.zip
powershell Compress-Archive -Path "world" -DestinationPath "backups\world_backup_%datestamp%.zip" -Force

echo Backup completed!
pause