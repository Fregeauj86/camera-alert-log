@echo off
:loop
ping 192.168.1.X -n 1 >nul
if errorlevel 1 (
    echo [%date% %time%] Camera is OFFLINE >> camera_log.txt
    echo Camera is offline!
) else (
    echo [%date% %time%] Camera is online >> camera_log.txt
)
timeout /t 60
goto loop
