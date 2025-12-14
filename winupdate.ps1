Start-Process powershell -Verb RunAs -ArgumentList @(
    '-NoExit',
    '-Command',
    '& {
        Install-Module PSWindowsUpdate -Force -Confirm:$false
        Import-Module PSWindowsUpdate
        Get-WindowsUpdate -Install -AcceptAll -AutoReboot
    }'
)
