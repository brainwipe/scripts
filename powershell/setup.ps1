Write-Host "Rob Lang personal setup script"
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host("Not running as administrator! Please run PowerShell as admin.") -ForegroundColor Red;
    exit;
}

winget install -e --id Amazon.AWSVPNClient
winget install JanDeDobbeleer.OhMyPosh --source winget
Install-Module -Name Terminal-Icons -Repository PSGallery
winget install -e --id Google.GoogleDrive
winget install -e --id Obsidian.Obsidian
winget install -e --id Discord.Discord
winget install -e --id WhatsApp.WhatsApp
winget install -e --id Spotify.Spotify

Write-Host "Copying Powershell Profile and OhMyPosh config"
Copy-Item -Path C:\Projects\brainwipe\scripts\powershell\Microsoft.PowerShell_profile.ps1 -Destination $PROFILE -Force

if (Test-Path c:\Users\%USERNAME%\Documents\WindowsPowerShell\OhMyPosh) {
    Remove-Item -Path c:\Users\%USERNAME%\Documents\WindowsPowerShell\OhMyPosh -Force -Recurse
}
Copy-Item -Path C:\Projects\brainwipe\scripts\powershell\OhMyPosh -Destination c:\Users\%USERNAME%\Documents\WindowsPowerShell -Force

Write-Host "Manual Steps:" -ForegroundColor Yellow
Write-Host " - Install Cascaydia Cove Nerd Font https://www.nerdfonts.com/font-downloads" 
Write-Host " - Search 'Mouse Pointer and Touch' and change mouse pointer size to 3"
Write-Host " - Import terminal settings from /Terminal folder"
