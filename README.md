# idaes-ptl-setup — IDAES Power-to-Liquid Modelling Environment

> **MSc Renewable Energy · Cranfield University — Group Project Support**  
> Automated setup, smoke tests, and team onboarding for IDAES-based Power-to-Liquid (PtL) process modelling on Windows

---

## Background

**Power-to-Liquid (PtL)** is a pathway for producing synthetic sustainable aviation fuel (SAF) and other liquid fuels from renewable electricity. The process uses electrolysers — in our case, **Solid Oxide Electrolysis Cells (SOEC)** — to split water (or CO₂/H₂O mixtures) into hydrogen and oxygen using surplus renewable power, which is then converted to liquid hydrocarbons via Fischer-Tropsch synthesis.

This repo supports our MSc group project: **"AI-Assisted Control of Solid Oxide Electrolyser for Sustainable Fuel Production under Intermittent Renewable Energy"** — which investigates how machine learning control strategies can handle the dynamic power input variability from wind and solar generation.

**IDAES** (Institute for the Design of Advanced Energy Systems) is a DOE-funded open-source process modelling framework built on Pyomo. It provides equation-oriented, high-fidelity models for electrochemical systems including solid oxide cells — making it the right tool for detailed PtL techno-economic and dynamic analysis.

---

## What This Repo Contains

| File | Purpose |
|------|---------|
| `setup.bat` | Automated Windows installer — creates conda environment, installs IDAES and dependencies, downloads solver binaries |
| `setup.md` | Step-by-step manual setup guide with troubleshooting notes |
| `smoke_test.ipynb` | Verification notebook — runs a minimal SOEC model to confirm the environment is working correctly |
| `.gitignore` | Excludes solver binaries, large data files, and environment-specific paths |

---

## Quick Start (Windows)

**Option 1 — Automated (recommended)**

```bat
git clone https://github.com/lawal-sbh/idaes-ptl-setup.git
cd idaes-ptl-setup
setup.bat
```

The script will:
1. Create a dedicated conda environment (`idaes-ptl`)
2. Install IDAES and all required dependencies
3. Download IDAES solver extensions (IPOPT, k_aug, etc.)
4. Run a basic import check

**Option 2 — Manual**

Follow the step-by-step instructions in [`setup.md`](setup.md).

---

## Verify Your Installation

After setup, open `smoke_test.ipynb` in Jupyter:

```bash
conda activate idaes-ptl
jupyter notebook smoke_test.ipynb
```

A successful run will import IDAES, instantiate a basic unit model, and solve a simple mass-balance problem. If all cells complete without error, your environment is ready for PtL modelling.

---

## Why IDAES for This Work?

Most energy systems modelling tools (NREL SAM, HOMER, EnergyPlus) are designed for steady-state system-level analysis. When modelling an SOEC electrolyser under **intermittent renewable power input**, you need:

- **Dynamic simulation** — the electrolyser's thermal mass, degradation, and startup/shutdown behaviour matter
- **Equation-oriented modelling** — allows simultaneous solution of thermodynamic, electrochemical, and control equations
- **High-fidelity cell models** — IDAES includes validated SOEC unit operation models from NETL research

This combination is what enables the AI control work in the group project — you cannot train a meaningful ML controller against a black-box model.

---

## Project Context

This setup repository is part of a broader portfolio on AI-enabled control of grid-interactive energy conversion systems:

| Project | Description |
|---------|-------------|
| This repo | IDAES environment for SOEC/PtL process modelling |
| [batteryCLASS](https://github.com/lawal-sbh/batteryCLASS) | RL-based dispatch optimisation for grid-scale BESS |
| [50MWp-storageMODEL](https://github.com/lawal-sbh/50MWp-storageMODEL) | Techno-economic analysis for grid-connected storage |

**MSc Dissertation (individual):** Self-Commissioning, Stability-Certified Grid-Forming Control for Hybrid PEM-Alkaline Electrolysers in Low-Inertia Microgrids

---

## Troubleshooting

**IPOPT solver not found after setup**  
Run `idaes get-extensions` manually from within the `idaes-ptl` conda environment.

**Conda environment conflicts**  
IDAES requires Python ≥ 3.8 and has specific Pyomo version requirements. Do not install into a base or shared environment — always use the dedicated `idaes-ptl` environment.

**Windows path issues with solver binaries**  
Ensure the IDAES extensions directory is on your PATH. The `setup.bat` handles this automatically; manual installers may need to add it explicitly.

---

## Requirements

- Windows 10/11 (this setup is Windows-specific; Linux/macOS users should follow [IDAES official docs](https://idaes-pse.readthedocs.io/en/stable/))
- [Anaconda](https://www.anaconda.com/download) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
- ~4GB disk space (IDAES + solver binaries)

---

**Author:** Hassan Lawal · Cranfield University · [LinkedIn](https://linkedin.com/in/hassanlawal-13943475)  
**Stack:** Python · IDAES · Pyomo · IPOPT · Jupyter
