. .\Variables.ps1

if (!(Test-Path $pkgCachePath)) {
    New-Item $pkgCachePath -ItemType 'Directory' | Out-Null
}

[Xml]$o = Get-Content $chocoConfig

foreach ($package in $o.packages.package) {
    if ($package.version) {
        .\ChocolateStore.exe $pkgCachePath "$chocoApiPath/$($package.id)/$($package.version)"
    }

    .\ChocolateStore.exe $pkgCachePath "$chocoApiPath/$($package.id)"
#                                       https://chocolatey.org/api/v2/package/<package>    
}
