$NewItemParams = @{
    Path     = "~/.gitconfig"
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\dotfiles\git\.gitconfig"
    Force    = $true
}

New-Item @NewItemParams

$NewItemParams = @{
    Path     = "~/.gitconfig-ple103"
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\dotfiles\git\.gitconfig-ple103"
    Force    = $true
}

New-Item @NewItemParams

$NewItemParams = @{
    Path     = "~/.gitconfig-work"
    ItemType = "SymbolicLink"
    Value    = "$PSScriptRoot\dotfiles\git\.gitconfig-work"
    Force    = $true
}

New-Item @NewItemParams