@echo off

echo Checking if Docker Desktop is installed...

docker --version >nul 2>&1

if %errorlevel% == 0 (
    echo Docker Desktop is already installed!
) else (
    echo Docker Desktop is not installed. Installing...
    choco install docker-desktop -y
    echo Docker Desktop installed successfully!
)