. .\Variables.ps1

if (!(Test-Path $pkgCachePath)) {
    New-Item $pkgCachePath -ItemType 'Directory' | Out-Null
}

[Xml]$o = Get-Content $chocoConfig

foreach ($package in $o.packages.package.id) {
    .\ChocolateStore.exe $pkgCachePath "$chocoApiPath/$package"
#                                       https://chocolatey.org/api/v2/package/<package>    
}
