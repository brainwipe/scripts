# Sets the default Powershell Command Prompt as: [time] currentdir >
# and clears the window.
# Put in %UserProfile%\Documents\WindowsPowerShell\
# https://github.com/brainwipe/scripts
function Prompt {
  # Print the current time:
  Write-Host ("[") -nonewline
  Write-Host (Get-Date -format HH:mm.ss) -nonewline
  Write-Host ("] ") -nonewline
  # Print the working directory:
  $p = Split-Path -leaf -path (Get-Location)
  Write-Host ($p) -nonewline
  Write-Host (">") -nonewline
  return " ";
}

# Oh My Posh https://ohmyposh.dev/docs/
$env:POSH_SESSION_DEFAULT_USER = [System.Environment]::Username
oh-my-posh --init --shell pwsh --config (Join-Path -Path (Split-Path -Parent -Path $PROFILE) -ChildPath 'OhMyPosh/ohmyposhv3.json') | Invoke-Expression

# From: Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons

Import-Module PSReadLine

# Import all the functions in the Network module in ./Modules/Network.psm1
Import-Module Network -DisableNameChecking

$env:PSModulePath = $env:PSModulePath + ";c:\Projects\MCO\MCO.PowershellCore\src"
Import-Module MCO -DisableNameChecking

# Move to C: and clear the screen
Set-Location c:/Projects/MCO

