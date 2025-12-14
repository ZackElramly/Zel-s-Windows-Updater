
Start-Process powershell -Verb RunAs -ArgumentList @(
    '-NoExit',
    '-Command',
    '& {
        $ProgressPreference = ''Continue''
        $VerbosePreference  = ''Continue''
        Write-Host "Installing NuGet provider..."
        Install-PackageProvider -Name NuGet -Force | Out-Host
        Write-Host "Installing PSWindowsUpdate module..."
        Install-Module PSWindowsUpdate -Force -Confirm:$false | Out-Host
        Write-Host "Importing module..."
        Import-Module PSWindowsUpdate | Out-Host
        Write-Host "Starting Windows Update..."
        Get-WindowsUpdate -Install -AcceptAll -AutoReboot | Out-Host
    }'
)
