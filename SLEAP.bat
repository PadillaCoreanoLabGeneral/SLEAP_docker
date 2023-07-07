@echo off

echo Checking if Docker Desktop is installed...

docker --versiona >nul 2>&1

if %errorlevel% == 0 (
    echo Docker Desktop is already installed!
) else (
    echo Docker Desktop is not installed.
    echo Please install Docker Dekstop
    echo Docker Desktop installed successfully!
)

echo Checking if Anaconda is installed...

conda --version

if %errorlevel% == 0 (
    echo Conda is already installed!
) else (
    echo Conda is not installed. Installing...
    echo Please install Anaconda/Conda/miniconda  
    echo Anaconda installed successfully!
)

pause