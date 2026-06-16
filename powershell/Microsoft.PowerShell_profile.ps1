# Sets the default Powershell Command Prompt as: [time] currentdir >
# and clears the window.
# Put in %UserProfile%\Documents\WindowsPowerShell\
# https://github.com/brainwipe/scripts

# Oh My Posh https://ohmyposh.dev/docs/
$env:POSH_SESSION_DEFAULT_USER = [System.Environment]::Username
oh-my-posh --init --shell pwsh --config (Join-Path -Path (Split-Path -Parent -Path $PROFILE) -ChildPath 'OhMyPosh/ohmyposhv3.json') | Invoke-Expression

# From: Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons

Import-Module PSReadLine

$env:PSModulePath = $env:PSModulePath + ";c:\Projects\MCO\MCO.PowershellCore\src"
Import-Module MCO -DisableNameChecking

# Move to C: and clear the screen
Set-Location c:/Projects/MCO
Clear-Host

