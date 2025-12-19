# Zel's Windows Updater!
Little tool I wrote to automatically run windows update through command line.  
This tool was created for three reasons  
  1. To ensure there is no BS with windows where updates are initated and some will install then the pc reboots, and there will still be updates in settings  
  1. To have a tool to apply updates in OOBE to preload device drivers. Some laptops lose KB+trackpad or network drivers if doing a fresh windows install.
  2. laziness

this tool can be ran by running the following command in windows powershell.  
it can be ran in both admin privledged and non privledged PS window  
    as long as the user running has admin privledge  
    `irm https://raw.githubusercontent.com/ZackElramly/Zel-s-Windows-Updater/refs/heads/main/winupdate.ps1 | iex`


**!! ALWAYS BE CAREFUL RUNNING COMMANDS WITH IRM xxx | IEX !!**  
**!! IT CAN BE DANGEROUS FROM UNTRUSTED SOUCES !!**  
*-ZEL*
