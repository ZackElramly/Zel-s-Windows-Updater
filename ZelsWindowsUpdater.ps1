#Requires -RunAsAdministrator
Set-ExecutionPolicy RemoteSigned
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Get-WindowsUpdate -Install -AcceptAll -AutoReboot
#Get-WindowsUpdate
#Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
