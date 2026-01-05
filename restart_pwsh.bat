@echo off
:loop
"C:\Program Files\PowerShell\7\pwsh.exe" -File "C:\path\to\myscript.ps1"
IF %ERRORLEVEL% EQU -1073741510 (
    echo [%DATE% %TIME%] PowerShell was terminated (code -1073741510). Restarting... >> pwsh_restart.log
    goto loop
) ELSE (
    echo [%DATE% %TIME%] PowerShell exited with code %ERRORLEVEL%. >> pwsh_restart.log
    pause
)