@echo off
REM Universal AlphaEya launcher for Windows and WSL/Git Bash

REM Detect if running in WSL
ver | findstr /i "Microsoft" >nul
if %errorlevel%==0 goto :WSL

REM Detect if running in Git Bash (MSYS)
setlocal
set "MSYSTEM_VAR=%MSYSTEM%"
if not "%MSYSTEM_VAR%"=="" goto :GITBASH
endlocal

REM Default: Windows PowerShell/Command Prompt
REM Use Windows batch script
start "AlphaEya" cmd /k "cd /d %~dp0 && .\launch_alphaeya.cmd"
goto :EOF

:WSL
bash -c "cd /mnt/%cd:~0,1%/%cd:~3% && ./start_alphaeya.sh"
goto :EOF

:GITBASH
bash -c "cd /%cd:~0,1%/%cd:~3% && ./start_alphaeya.sh"
goto :EOF
