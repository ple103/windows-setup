#Requires -RunAsAdministrator
#Requires -Version 5.1

Write-Warning -Message "Configure OneDrive backup before continuing"
Start-Sleep -Milliseconds 1000

#TODO Add a check to skip if winget already installed
Write-Host "Installing WinGet PowerShell module from PSGallery.."
Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null

$MyDocuments = [Environment]::GetFolderPath("MyDocuments")
$PowerShell5ProfilePath = "$MyDocuments\WindowsPowerShell"
$PowerShell7ProfilePath = "$MyDocuments\PowerShell"

# Create symlink for Windows PowerShell 5.1 profile
#TODO Add a check to backup if there is an existing profile file
Write-Output "Creating symlink for PowerShell 5.1 profile"

$params = @{
    Path     = "$PowerShell5ProfilePath\Microsoft.PowerShell_profile.ps1"
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\Profiles\Microsoft.PowerShell5_profile.ps1"
    Force    = $true
}

New-Item @params

# Create symlink for PowerShell 7 profile
#TODO Add a check to backup if there is an existing profile file
Write-Output "Creating symlink for PowerShell 7 profile"

$params = @{
    Path     = "$PowerShell7ProfilePath\Microsoft.PowerShell_profile.ps1"
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\Profiles\Microsoft.PowerShell7_profile.ps1"
    Force    = $true
}

New-Item @params

#TODO Add section to install modules
#TODO Install Sizer 4.0 and create scheduled task that runs it as admin
