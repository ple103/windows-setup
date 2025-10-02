# Written to be compatible with Windows PowerShell (5.1)

Write-Warning -Message "Configure OneDrive backup before continuing"
Start-Sleep -Milliseconds 1000

if (-not
    # Current role
    (New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    # Is admin?
    )).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
) {
    # Elevate script and exit current shell
    $params = @{
        FilePath     = 'powershell'
        ArgumentList = ('-File', $MyInvocation.MyCommand.Source, $args ` | ForEach-Object { $_ } )
        Verb         = 'RunAs'
    }
    Start-Process @params
    exit
}

Write-Host "Installing WinGet PowerShell module from PSGallery.."
Install-PackageProvider -Name NuGet -Force | Out-Null
Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null

$MyDocuments = [Environment]::GetFolderPath("MyDocuments")
$PowerShell5ProfilePath = "$MyDocuments\WindowsPowerShell"
$PowerShell7ProfilePath = "$MyDocuments\PowerShell"

# Create symlink for Windows PowerShell 5.1 profile

Write-Output "Creating symlink for PowerShell 5.1 profile"

$params = @{
    Path     = "$PowerShell5ProfilePath\Microsoft.PowerShell_profile.ps1"
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\Profiles\Microsoft.PowerShell5_profile.ps1"
    Force    = $true
}

New-Item @params

# Create symlink for PowerShell 7 profile
Write-Output "Creating symlink for PowerShell 5.1 profile"

$params = @{
    Path     = "$PowerShell7ProfilePath\Microsoft.PowerShell_profile.ps1"
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\Profiles\Microsoft.PowerShell5_profile.ps1"
    Force    = $true
}

New-Item @params
