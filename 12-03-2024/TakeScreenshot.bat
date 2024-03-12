@echo off
setlocal

:: Set the destination folder on the D drive
set "destination=D:\Screenshots"

:: Create the destination folder if it doesn't exist
if not exist "%destination%" mkdir "%destination%"

:loop
:: Get the current username and store it in a text file
whoami > "%destination%\Username.txt"

:: Set the filename with a timestamp and username
set "filename=Screenshot_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%_%username%.png"

:: Use PowerShell to take a screenshot and save it to the destination folder
powershell -executionpolicy bypass -file "%~dp0TakeScreenshot.ps1"

echo Screenshot saved to: %destination%\%filename%

:: Wait for 5 seconds before taking the next screenshot (adjust the timeout as needed)
timeout /nobreak /t 5 >nul

goto :loop

endlocal
