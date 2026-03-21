# IDAES Power-to-Liquid Environment Setup

## Prerequisites
- Windows 10/11 64-bit
- Remove any existing Python installations before starting
- Admin access required

## Step 1 — Install Miniconda
Run in Admin Command Prompt:
```cmd
curl -o miniconda.exe https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
start /wait miniconda.exe /S /AddToPath=1 /RegisterPython=1 /D=C:\Users\%USERNAME%\miniconda3
C:\Users\%USERNAME%\miniconda3\Scripts\conda.exe init cmd.exe
```
Close and reopen Command Prompt, then verify:
```cmd
conda --version
```

## Step 2 — Accept Conda Terms of Service
```cmd
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/msys2
```

## Step 3 — Create IDAES Environment
```cmd
conda create --yes --name idaes-env python=3.10
conda activate idaes-env
```

## Step 4 — Install IDAES and Solvers
```cmd
pip install idaes-pse
idaes get-extensions
pip install jupyter notebook watertap
```

## Step 5 — Verify Installation
```cmd
python -c "import idaes; print('IDAES version:', idaes.__version__)"
```
Expected output:
```
IDAES version: 2.11.0
IPOPT available: True
```

## Step 6 — Launch Jupyter
```cmd
jupyter notebook
```

## Known Issues & Fixes
- **conda not recognised**: Use `%USERNAME%\miniconda3\Scripts\conda.exe init cmd.exe`
- **Python conflict**: Remove all standalone Python installs before Miniconda
- **Terms of Service error**: Run Step 2 before creating environments
