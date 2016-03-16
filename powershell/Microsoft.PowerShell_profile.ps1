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
cd \
Clear-Host