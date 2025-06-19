$ip = "192.168.1.8"
$logFile = "camera_log.txt"
$botToken = "7665438938:AAGkftuhKbenIeOXh0RdvgBbBFKQOxtnQ_w"
$chatId = 5067814050
$alertSent = $false

while ($true) {
    $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    if (-not $ping) {
        Write-Output "${timestamp}: Camera is OFFLINE"
        Add-Content -Path $logFile -Value "${timestamp}: Camera is OFFLINE"

        if ($lastStatus -ne "offline") {
            $message = "🚨 Your IPC360 camera at $ip is OFFLINE!"
            $url = "https://api.telegram.org/bot$botToken/sendMessage?chat_id=$chatId&text=$([uri]::EscapeDataString($message))"
            Write-Output "Sending Telegram alert: $message"
            Invoke-RestMethod -Uri $url -Method Get

            # Show popup using msg
            $msg = "Camera is OFFLINE!"
            Start-Process msg -ArgumentList "* $msg"

            $lastStatus = "offline"
        }
    } else {
        Write-Output "${timestamp}: Camera is ONLINE"
        Add-Content -Path $logFile -Value "${timestamp}: Camera is ONLINE"

        if ($lastStatus -ne "online") {
            $message = "✅ Your IPC360 camera at $ip is back ONLINE."
            $url = "https://api.telegram.org/bot$botToken/sendMessage?chat_id=$chatId&text=$([uri]::EscapeDataString($message))"
            Write-Output "Sending Telegram alert: $message"
            Invoke-RestMethod -Uri $url -Method Get

            # Show popup using msg
            $msg = "Camera is ONLINE!"
            Start-Process msg -ArgumentList "* $msg"

            $lastStatus = "online"
        }
    }

    Start-Sleep -Seconds 60
}