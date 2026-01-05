@echo off
REM === BACKEND SETUP ===
cd /d E:\AlphaEya\backend

REM Create venv if it doesn't exist
if not exist venv (
    python -m venv venv
)

REM Activate venv
call venv\Scripts\activate.bat


REM Install backend dependencies (only if needed)
if exist requirements.txt (
    pip install --upgrade pip
    pip install -r requirements.txt
)

REM Start FastAPI backend (runs in new window)
start "FastAPI" cmd /k "cd /d E:\AlphaEya\backend && call venv\Scripts\activate.bat && uvicorn main:app --reload"

REM === FRONTEND SETUP ===
cd /d E:\AlphaEya\frontend


REM Install frontend dependencies (only if needed)
if not exist node_modules (
    npm install
)

REM Start frontend (runs in new window)
start "Frontend" cmd /k "cd /d E:\AlphaEya\frontend\app && npm run dev"

REM === OPEN PROJECT IN VS CODE ===
cd /d E:\AlphaEya
code .

echo All systems go! AlphaEya is ready to use.
pause
