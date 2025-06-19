# IPC360 Camera Status Monitor 🛡️

This PowerShell script monitors a network-connected IPC360 camera and alerts you via:

✅ Telegram Push Notification  
✅ Windows Popup Message  
✅ Local Logging (camera_log.txt)

### 🔧 Features

- Checks camera status every 60 seconds using ping
- Sends Telegram message when camera goes OFFLINE or comes back ONLINE
- Displays a Windows popup alert
- Saves a time-stamped log locally

### 📦 Requirements

- Windows 10 or 11
- PowerShell 5.1+ (works with PowerShell 7 using `msg`)
- Telegram bot token and chat ID
- Your IPC360 camera must have a static IP (e.g. `192.168.1.8`)

### 🛠 Setup

1. **Clone the repo:**

```bash
git clone https://github.com/YOUR_USERNAME/camera-status-monitor.git