# Win11-LTSC2024-Help InPlace-Upgrade
> **Reclaim Hardware Performance — Kill Background "RAM Tax" — Upgrade to Windows 11 LTSC 2024 Preserving 100% of Data, Apps & Drivers.**

![Windows 11 LTSC](https://img.shields.io/badge/Windows-11%20LTSC%202024-0078D4?style=for-the-badge&logo=windows)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Size](https://img.shields.io/badge/Script%20Size-%3C%203KB-brightgreen?style=for-the-badge)

---

## 🛑 The Problem: "RAM Tax" & Risks of Custom Windows Mods
* **Windows 11 Bloatware:** Background services like Edge Update, Telemetry, and Copilot/AI constantly devour system resources even at idle.
* **Soaring RAM Prices:** Upgrading hardware is becoming increasingly expensive and isn't a practical option for everyone.
* **Risks of Modded ISOs / Ghost Builds:** Custom Windows ISOs floating around the web are heavily modified and often contain **malware, keyloggers**, or stripped critical system files that cause stability bugs.

---

## 💡 The Solution: Official LTSC 2024 + Automated Script
This method allows you to seamlessly upgrade to **official Microsoft Windows 11 Enterprise LTSC 2024** (the lightweight, bloat-free enterprise edition) using native **In-place Upgrade**:

1. **100% Safe:** Uses official, untouched Microsoft LTSC ISO files.
2. **Zero Data Loss:** Preserves 100% of your personal files, installed applications, and drivers (Wi-Fi, GPU, Audio, etc.).
3. **100% Open Source:** Lightweight script (< 3KB) with fully transparent code in `.bat` format—audit every line before executing.

---

## 🛠️ How to Use (3 Simple Steps)

### 1️⃣ Step 1: Run the Preparation Script
* Download [`debloat_ltsc_prep.bat`](./debloat_ltsc_prep.bat) to your computer.
* **Right-click** the file -> Select **`Run as Administrator`**.
* *The script automatically modifies the Registry (EditionID) and disables bloat background services.*

### 2️⃣ Step 2: Run the LTSC 2024 ISO
* Download the official **Windows 11 LTSC 2024** ISO from Microsoft.
* Double-click the ISO file to mount it (or extract it).
* Run `setup.exe`.

### 3️⃣ Step 3: Confirm Upgrade Option (CRITICAL)
* On the installation wizard screen, ensure you select:
  👉 **`Keep personal files and apps`**.
* Click **Next** and wait for the system upgrade to complete!

---

## 🛡️ Code Transparency
You can inspect `debloat_ltsc_prep.bat` in Notepad at any time. The script only performs 3 core actions:
* **Registry Switch:** Changes `EditionID` to `EnterpriseS` to unlock the LTSC in-place upgrade path.
* **Edge Killer:** Disables background `edgeupdate` services and Startup Boost features.
* **Telemetry Off:** Disables `DiagTrack` to stop background data collection.

---

## 📄 License
This project is released under the **MIT License** — feel free to share, modify, and distribute.
