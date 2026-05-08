# 🖥️ SuperInstaller – Automated Educational Software Deployment

> **Real Client Project** | Super Teacher – Edureforms Pvt Ltd  
> **Role:** DevOps Engineer &nbsp;|&nbsp; **Duration:** Aug 2025 – May 2026 (ongoing)

---

## 🌐 Live Portfolio

| Page | Link |
|------|------|
| 🖥️ Portfolio Page | [View Portfolio](https://jhansi-112.github.io/SuperInstaller-Educational-Deployment/index.html) |
| 📄 Project Documentation | [View Documentation](https://jhansi-112.github.io/SuperInstaller-Educational-Deployment/documentation.html) |

---

## 📌 Overview

SuperInstaller is a **one-click automated deployment tool** built for school lab environments.  
It installs 15+ educational applications and all required prerequisite software on **32-bit and 64-bit Windows** machines — no technical expertise needed.

School administrators simply right-click `START_HERE.bat` → **Run as Administrator**, and the entire setup runs automatically.

---

## 🎯 Problem Solved

| Problem | Solution |
|---------|----------|
| 15+ apps had to be installed manually on every school PC | One-click batch script automates the full sequence |
| MIT App Inventor Emulator was failing silently | JRE, .NET, and Visual C++ are auto-installed first as prerequisites |
| Some installers crashed and broke the whole sequence | `if exist` guards skip already-installed software gracefully |
| 32-bit (General Lab) and 64-bit (Da Vinci Lab) needed different packages | Two separate installer folders with correct architecture builds |
| No logs = no way to diagnose failures | Per-software logs + summary `install_log.txt` generated automatically |

---

## 🛠️ Technologies Used

- **Windows Batch Scripting (.bat)** – core automation
- **Silent install flags** – zero-click background installation per software
- **Logging mechanism** – per-software log + install_log.txt summary
- **if exist guards** – crash-safe sequential installation

---

## 📁 Folder Structure

```
SuperInstaller/
│
├── OneInstaller_32bit/               ← General Lab (32-bit Windows)
│   ├── START_HERE.bat                ← Run this as Administrator
│   ├── Offline-Online-Software files/
│   │   ├── jre-8u461.exe
│   │   ├── dotnet48.exe
│   │   ├── vc_redist_x86.exe
│   │   └── (all 32-bit educational installers)
│   ├── Manual_Install/
│   │   ├── Scratch_Installer.url     ← Opens official download page
│   │   └── MakeCode_Arcade.url       ← Opens official download page
│   ├── install_log.txt               ← Generated after install
│   └── README.txt
│
├── OneInstaller_64bit/               ← Da Vinci Lab (64-bit Windows)
│   ├── START_HERE.bat                ← Run this as Administrator
│   ├── Offline-Online-Software files/
│   │   ├── jre-8u461.exe
│   │   ├── dotnet48.exe
│   │   ├── vc_redist_x64.exe
│   │   └── (all 64-bit educational installers)
│   ├── install_log.txt               ← Generated after install
│   └── README.txt
│
└── Docs/
    └── SuperInstaller_ProjectDocumentation.pdf
```

> **Note:** The actual `.exe` installer files are not included in this repository due to size limits.  
> Only the batch scripts, documentation, and README files are version-controlled here.

---

## 📦 Software Included

### Prerequisites (auto-installed first on both 32-bit & 64-bit)

| Software | Version | Purpose |
|----------|---------|---------|
| Java Runtime (JRE) | 8u461 | Required for MIT App Inventor Emulator |
| .NET Framework | 4.8 | Required for MIT App Inventor Emulator |
| Visual C++ Redistributable | 2015–2022 | Required for MIT App Inventor Emulator |

### Educational Software – 32-bit Package

| Software | Version |
|----------|---------|
| TuxTyping | 1.8.1 |
| Tux Paint | Latest |
| Childsplay | 1.6 |
| GCompris | 4.3.1 |
| Krita | 4.4.2 |
| OpenShot | 3.2.1 |
| Python | 3.13.2 |
| MIT App Inventor Tools | 30.265.0 |
| Scratch *(manual – internet required)* | 3.29.1 |
| MakeCode Arcade *(manual – internet required)* | Latest |

### Educational Software – 64-bit Package

| Software | Version |
|----------|---------|
| GCompris | 25.0 |
| Krita | 5.2.6 |
| OpenShot | 3.2.1 |
| Python | 3.13.2 |
| MIT App Inventor Tools | 30.265.0 |
| Scratch | 3.29.1 |
| ScratchJr | Latest |
| MakeCode Arcade | Latest |
| Mind+ | Latest |
| GDevelop | Latest |
| Kodu Game Lab | Latest |
| BlueJ | Latest |
| Arduino IDE | Latest |

---

## ⚙️ How It Works

### Step 1 – Prerequisites (auto)
The batch script detects your system architecture and silently installs:
```
JRE 8u461  →  .NET Framework 4.8  →  Visual C++ Redistributable
```

### Step 2 – Enable Windows Features (for MIT App Inventor)
Required Windows features for MIT App Inventor Emulator:
- ✅ Virtual Machine Platform
- ✅ Windows Hypervisor Platform
- ✅ Hyper-V *(if available)*

> On Windows 11 23H2/24H2 these are usually already enabled.

### Step 3 – Educational Software (auto)
All software installs silently in sequence.  
`if exist` guards ensure a crashed installer does not stop the next one.

### Step 4 – Logging
After completion:
- Individual log file per software
- Summary `install_log.txt` in the Offline-Online-Software files folder
- If anything failed → email `install_log.txt` to support@superteacher.in

---

## ✅ Tested On

| Windows Version | 32-bit | 64-bit |
|-----------------|--------|--------|
| Windows 7 | ✅ | ✅ |
| Windows 8 / 8.1 | ✅ | ✅ |
| Windows 10 | ✅ | ✅ |
| Windows 11 (21H2/22H2) | ✅ | ✅ |
| Windows 11 23H2 / 24H2 | ⚠️ MIT App Inventor only | ⚠️ MIT App Inventor only |

---

## ⚠️ Known Issue

MIT App Inventor Emulator does **not** work correctly on **Windows 11 23H2/24H2** due to Microsoft's changes to Hyper-V and the Windows Subsystem. All other software installs and runs normally.

---

## 💡 Key DevOps Concepts Demonstrated

- **Infrastructure as Code (IaC) mindset** – repeatable, scripted deployment
- **Idempotent installs** – `if exist` guards make re-runs safe
- **Environment separation** – separate packages per architecture (32-bit / 64-bit)
- **Automated logging** – traceability for every install success/failure
- **Silent install research** – custom flags tested per software package
- **Real client delivery** – deployed in live school lab environments

---

## 📄 Portfolio Pages

| File | Description |
|------|-------------|
| 🌐 [`index.html`](./index.html) | Interactive portfolio page with software tables, how-it-works steps, OS compatibility |
| 🌐 [`documentation.html`](./documentation.html) | Full project documentation with sidebar navigation |

---

## 👩‍💻 Author

**Bukke JhansiBai**  
DevOps Engineer  
[LinkedIn](#) • [GitHub](https://github.com/Jhansi-112/SuperInstaller-Educational-Deployment)

