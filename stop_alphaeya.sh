#!/bin/bash
# Script to stop AlphaEya backend and frontend (Linux/macOS)

# Stop FastAPI backend
if [ -f fastapi.pid ]; then
  kill $(cat fastapi.pid) && echo "Stopped FastAPI backend (PID $(cat fastapi.pid))" && rm fastapi.pid
else
  echo "No fastapi.pid file found. Backend may not be running."
fi

# Stop frontend dev server
if [ -f frontend.pid ]; then
  kill $(cat frontend.pid) && echo "Stopped frontend dev server (PID $(cat frontend.pid))" && rm frontend.pid
else
  echo "No frontend.pid file found. Frontend may not be running."
fi

echo "AlphaEya servers stopped."
