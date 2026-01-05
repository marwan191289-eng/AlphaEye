# PowerShell script to fully automate AlphaEya setup and launch

# === BACKEND SETUP ===
Write-Host 'Setting up backend...'
Set-Location 'E:\AlphaEya\backend'

# Create venv if it doesn't exist
if (!(Test-Path 'venv')) {
    python -m venv venv
}

# Activate venv
. .\venv\Scripts\Activate.ps1

# Install backend dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Start FastAPI backend in new window
Start-Process powershell -ArgumentList '-NoExit', '-Command', 'cd E:\AlphaEya\backend; . .\venv\Scripts\Activate.ps1; uvicorn main:app --reload' -WindowStyle Normal

# === FRONTEND SETUP ===
Write-Host 'Setting up frontend...'
Set-Location 'E:\AlphaEya\frontend'

# Install frontend dependencies if needed
if (!(Test-Path 'node_modules')) {
    npm install
}

# Start frontend in new window
Start-Process powershell -ArgumentList '-NoExit', '-Command', 'cd E:\AlphaEya\frontend; npm run dev' -WindowStyle Normal

# === OPEN PROJECT IN VS CODE ===
Set-Location 'E:\AlphaEya'
code .

Write-Host 'All systems go! AlphaEya is ready to use.'
Read-Host 'Press Enter to exit...'
