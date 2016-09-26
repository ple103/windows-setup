# Install Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# Reload PowerShell
. $profile

# Install applications 
choco install .\packages.config -Source .\chocolatey-packages -Y
