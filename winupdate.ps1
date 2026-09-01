# Create variable to hold the code block.
$script = {
		# If command errors out at any point, end script rather than continue
		$ErrorActionPreference = 'Stop'
		
        #  Ensures output of commands are visible to user
        $ProgressPreference = 'Continue'

        # Installs dependency NuGet required for PSwinodwsUpdate if not already installed
		if (-not (Get-PackageProvider -ListAvailable NuGet -ErrorAction SilentlyContinue)) {
			Write-Host "Installing NuGet provider..."
            Install-PackageProvider NuGet -Force -Confirm:$false
        } else {
			Write-Host "NuGet provider dependency already installed."
		}

		# Install the Windows Update Module if not already installed
        if (-not (Get-Module -ListAvailable PSWindowsUpdate)) {
			Write-Host "Installing PSWindowsUpdate module..."
            Install-Module PSWindowsUpdate -Force -Confirm:$false
        } else {
			Write-Host "PSWindowsUpdate module already installed."
		}
		
		# Import the Windows Update Module so it can be used
        Write-Host "Importing Windows Update Powershell Module"
        Import-Module PSWindowsUpdate | Out-Host
		
		# Runs the windows update which will, check for available updates, downlaod them, install them, then restart automaitcally if needed
        Write-Host "Running Windows Update"
        Get-WindowsUpdate -Install -AcceptAll -AutoReboot | Out-Host
    }

# Start in a new powershell window to ensure things like Execution Policy only last for the script
# It will also ensure it is ran as admin
# Try catch ensures that if the wt.exe cannot be found (which happpens on some machines,
# especially ones that are still in OOBE)  then it will just default to powershell.

try {
	Start-Process wt.exe -Verb RunAs -ArgumentList @(
		'powershell'
		'-NoExit'
		'-NoProfile'
		'-ExecutionPolicy', 'Bypass'
		'-Command', $script
	)
}

catch {
	Start-Process powershell -Verb RunAs -ArgumentList @(
		'-NoExit',
		'-ExecutionPolicy', 'Bypass',
		'-Command', $script
	)
}
exit
