@echo off
echo ============================================
echo  IDAES Power-to-Liquid Environment Setup
echo ============================================

echo.
echo Step 1: Downloading Miniconda...
curl -o miniconda.exe https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe

echo.
echo Step 2: Installing Miniconda silently...
start /wait miniconda.exe /S /AddToPath=1 /RegisterPython=1 /D=C:\Users\%USERNAME%\miniconda3

echo.
echo Step 3: Accepting Terms of Service...
C:\Users\%USERNAME%\miniconda3\Scripts\conda.exe tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
C:\Users\%USERNAME%\miniconda3\Scripts\conda.exe tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
C:\Users\%USERNAME%\miniconda3\Scripts\conda.exe tos accept --override-channels --channel https://repo.anaconda.com/pkgs/msys2

echo.
echo Step 4: Creating IDAES environment...
C:\Users\%USERNAME%\miniconda3\Scripts\conda.exe create --yes --name idaes-env python=3.10

echo.
echo Step 5: Installing IDAES...
C:\Users\%USERNAME%\miniconda3\Scripts\conda.exe run -n idaes-env pip install idaes-pse
C:\Users\%USERNAME%\miniconda3\Scripts\conda.exe run -n idaes-env idaes get-extensions
C:\Users\%USERNAME%\miniconda3\Scripts\conda.exe run -n idaes-env pip install jupyter notebook watertap

echo.
echo ============================================
echo  Setup Complete!
echo  Run: conda activate idaes-env
echo  Then: jupyter notebook
echo ============================================
pause
