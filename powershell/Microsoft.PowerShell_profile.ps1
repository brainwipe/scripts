# Sets the default Powershell Command Prompt as: [time] currentdir >
# and clears the window.
# Put in %UserProfile%\Documents\WindowsPowerShell\
# https://github.com/brainwipe/Scripts

function Prompt {
  # Print the current time:
  Write-Host ("[") -nonewline -foregroundcolor DarkGray
  Write-Host (Get-Date -format HH:mm:ss) -nonewline -foregroundcolor Gray
  Write-Host ("] ") -nonewline -foregroundcolor DarkGray
  # Print the working directory:
  $p = Split-Path -leaf -path (Get-Location)
  Write-Host ($p) -nonewline
  Write-Host (" >") -nonewline -foregroundcolor Green
  return " ";
}

# Import all the functions in the Network module in ./Modules/Network.psm1
Import-Module Network

# Move to C: and clear the screen
cd \
Clear-Host