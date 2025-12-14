Start-Process powershell -Verb RunAs -ArgumentList @(
    '-NoExit',
    '-Command',
    '& {
        Install-PackageProvider -Name NuGet -Force | Out-Host
        Install-Module PSWindowsUpdate -Force -Confirm:$false | Out-Host
        Import-Module PSWindowsUpdate | Out-Host
        Get-WindowsUpdate -Install -AcceptAll -AutoReboot | Out-Host
    }'
)
