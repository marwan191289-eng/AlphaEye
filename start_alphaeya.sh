#!/bin/bash
# AlphaEya full automation script (Linux/macOS)

# --- BACKEND SETUP ---
cd "$(dirname "$0")/backend" || exit 1

if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Start FastAPI backend in background
nohup uvicorn main:app --reload > ../fastapi.log 2>&1 &
BACKEND_PID=$!
echo $BACKEND_PID > ../fastapi.pid

# --- FRONTEND SETUP ---
cd ../frontend || exit 1

if [ ! -d "node_modules" ]; then
  npm install
fi

# Start frontend dev server in background
nohup npm run dev > ../frontend.log 2>&1 &
FRONTEND_PID=$!
echo $FRONTEND_PID > ../frontend.pid

# --- OPEN PROJECT IN VS CODE (if available) ---
if command -v code >/dev/null 2>&1; then
  cd ..
  code .
fi

echo "AlphaEya backend and frontend started. Logs: fastapi.log, frontend.log"
echo "To stop: kill $(cat fastapi.pid) $(cat frontend.pid)"
