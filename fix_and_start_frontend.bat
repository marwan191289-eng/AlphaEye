@echo off
REM Automated fix and start for AlphaEya frontend (Windows)

cd /d E:\AlphaEya\frontend\app

REM Remove node_modules and package-lock.json if present
if exist node_modules rmdir /s /q node_modules
if exist package-lock.json del package-lock.json

REM Install dependencies
npm install

REM Start frontend dev server
npm run dev