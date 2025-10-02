$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) } )

if ($PSVersionTable.PSVersion -gt [version]7.0.0 -and $Host.UI.RawUI.WindowTitle -eq "Git") 
{
    $module = 'git-aliases'
    if (-not (Get-Module -Name $module)) 
    {
        Install-Module -Name $module
        Import-Module -Name $module
    }
    else {
        Import-Module -Name $module
    }
}