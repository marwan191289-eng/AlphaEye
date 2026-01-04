@echo off
REM === Stop FastAPI backend ===
for /f "tokens=2 delims==;" %%i in ('wmic process where "CommandLine like '%%uvicorn%%'" get ProcessId /value') do (
    echo Stopping FastAPI backend (PID %%i)
    taskkill /PID %%i /F
)

REM === Stop frontend dev server ===
for /f "tokens=2 delims==;" %%i in ('wmic process where "CommandLine like '%%npm%%run%%dev%%'" get ProcessId /value') do (
    echo Stopping frontend dev server (PID %%i)
    taskkill /PID %%i /F
)

echo All AlphaEya servers stopped.
pause
