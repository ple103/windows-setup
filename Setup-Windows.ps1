# Set PowerShell as default
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced `
    -Name DontUsePowerShellOnWinX -PropertyType DWord -Value 0 -Force

# Show file extensions
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced `
    -Name HideFileExt -PropertyType DWord -Value 0 -Force

# Disable UAC
New-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system `
    -Name EnableLUA -PropertyType DWord -Value 0 -Force

# Restart Windows Explorer
Stop-Process Explorer
Start-Process Explorer

# Install Chocolatey
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

# Reload PowerShell
. $profile

# Install applications 
choco install .\packages.config -Source .\chocolatey-packages -Y
