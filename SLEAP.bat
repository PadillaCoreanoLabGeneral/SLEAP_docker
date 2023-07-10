@echo off

echo Checking if Docker Desktop is installed...

docker --version >nul 2>&1

if %errorlevel% == 0 (
    echo Docker Desktop is installed!
    echo Logging Into Docker...
    docker login
    if %errorlevel% neq 0 (
        echo Login failed!
        exit /b %errorlevel%
    )

    echo Pulling Latest Version of Image: sleap...
    docker pull padillacoreanolab/sleap:latest || goto catch
    :catch

    echo Shutting Down Open Docker Containers With The Same Name ...
    docker stop sleap_c
    docker rm sleap_c
    echo.
    echo.

    echo Running Docker Container:  sleap_c...
    docker run --name sleap_c --gpus all --log-driver=json-file padillacoreanolab/sleap:latest bash -c "source activate sleap &&  sleap-label"

    pause

    echo Shutting Down Open Docker Container: sleap_c ...
    docker stop sleap_c
    docker rm sleap_c

) else (
    echo Docker Desktop is not installed.
    echo Please install Docker Dekstop
)

pause