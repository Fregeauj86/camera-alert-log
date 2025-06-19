# IPC360 Camera Status Monitor 🛡️

This PowerShell script monitors a network-connected IPC360 camera and alerts you via:

✅ Telegram Push Notification  
✅ Windows Popup Message  
✅ Local Logging (`camera_log.txt`)

---

### 🔧 Features

- Checks camera status every 60 seconds using ping
- Sends Telegram message when camera goes OFFLINE or comes back ONLINE
- Displays a Windows pop-up alert (Toast or fallback)
- Saves a time-stamped log locally

---

### 📦 Requirements

- Windows 10 or 11
- PowerShell 5.1+ (uses toast popups on Windows)
- A Telegram bot token and your chat ID
- IPC360 camera (or any device) with a **static IP**, e.g., `192.168.0.0`

---

### 🛠 Setup

#### 1. Clone the repository

```bash
git clone https://github.com/Fregeauj86/camera-alert-log.git
cd camera-alert-log
