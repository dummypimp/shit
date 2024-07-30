@echo off
setlocal

:: Python installation section
set PYTHON_VERSION=3.11.4
set PYTHON_INSTALLER=python-%PYTHON_VERSION%-amd64.exe
set PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/%PYTHON_INSTALLER%
set INSTALL_DIR=C:\Python%PYTHON_VERSION%

:: Download the Python installer
echo Downloading Python %PYTHON_VERSION% installer...
powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %PYTHON_INSTALLER%"

:: Run the installer silently
echo Installing Python %PYTHON_VERSION%...
%PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1 TargetDir=%INSTALL_DIR%

:: Clean up the installer
echo Cleaning up...
del %PYTHON_INSTALLER%

echo Python %PYTHON_VERSION% installation completed successfully.

:: Verify the installation
%INSTALL_DIR%\python.exe --version

endlocal
