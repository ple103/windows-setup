$NewItemParams = @{
    Path     = [System.Environment]::GetFolderPath('MyDocuments'), "\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -join ""
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\dotfiles\powershell\Microsoft.PowerShell5_profile.ps1"
    Force    = $true
}

New-Item @NewItemParams

$NewItemParams = @{
    Path     = ([System.Environment]::GetFolderPath('MyDocuments'), "\PowerShell\Microsoft.PowerShell_profile.ps1") -join ""
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\dotfiles\powershell\Microsoft.PowerShell7_profile.ps1"
    Force    = $true
}

New-Item @NewItemParams