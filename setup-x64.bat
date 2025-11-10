@echo off
REM Setup script for x64 build configuration
REM This script creates the necessary project files in submodules for x64 support

echo Setting up x64 build configuration for eMule Morph...
echo.

REM Check if we're in the right directory
if not exist "srchybrid\emule.sln" (
    echo Error: This script must be run from the repository root directory
    exit /b 1
)

REM Initialize submodules if needed
echo Checking submodules...
if not exist "cryptopp\.git" (
    echo Initializing submodules...
    git submodule init
    git submodule update
)

REM Note: The project files are too large to embed in a batch file
REM Run the bash version using Git Bash or WSL, or manually create the files

echo.
echo Please run setup-x64.sh using Git Bash or WSL to create the project files.
echo Alternatively, see X64_BUILD.md for manual setup instructions.
echo.
pause
