$cmd = @"
Start-Process powershell -Verb RunAs
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Get-WindowsUpdate -Install -AcceptAll -AutoReboot
"@

Start-Process powershell -Verb RunAs `
  -ArgumentList "-NoExit -Command `$cmd"

#Requires -RunAsAdministrator
#Set-ExecutionPolicy RemoteSigned
#Get-WindowsUpdate
#Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
