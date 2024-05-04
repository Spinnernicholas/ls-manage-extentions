@echo off

set "SCRIPT=scripts/dev"

if "%1" == "--wsl" (
    goto :wsl
)

:: Check if Python exists
where python > nul 2>&1
if %errorlevel% equ 1 (
    :: Python does not exist
    echo Python is not installed.
    exit /b 1
)

python %SCRIPT% %*

exit /b

:wsl
shift

where wsl > nul 2>&1
if %errorlevel% equ 1 (
    :: WSL does not exist
    echo WSL is not installed.
    exit /b 1
)

wsl %SCRIPT% %*

exit /b