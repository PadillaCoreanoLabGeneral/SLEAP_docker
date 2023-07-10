@echo off

echo Checking if Docker Desktop is installed...

docker --versiona >nul 2>&1

if %errorlevel% == 0 (
    echo Docker Desktop is already installed!
) else (
    echo Docker Desktop is not installed.
    echo Please install Docker Dekstop
)

pause