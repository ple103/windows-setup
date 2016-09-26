# Set PowerShell as default
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name DontUsePowerShellOnWinX -PropertyType DWord -Value 0 -Force

# Restart Windows Explorer
Stop-Process Explorer
Start-Process Explorer

# Install Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Reload PowerShell
. $profile

# Install applications 
choco install .\packages.config -Source .\chocolatey-packages -Y
