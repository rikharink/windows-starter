#--- Setup ---
Disable-UAC
Disable-MicrosoftUpdate

Disable-BingSearch
Disable-GameBarTips
Set-TaskbarOptions -Size Small -Lock -Dock Bottom -Combine Always -AlwaysShowIconsOff

function executeScript {
    Param ([string]$script)
    $run = "..\helpers\$script"
    Write-Host "Executing $run"
    Invoke-Expression $run
}

#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "Tools.ps1";
executeScript "SourceControl.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "HyperV.ps1";
executeScript "Docker.ps1";
executeScript "WSL.ps1";
executeScript "Browsers.ps1";
executeScript "Media.ps1";
executeScript "WebDev.ps1";
executeScript "DotNet.ps1";
executeScript "Development.ps1";

#--- Cleanup ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula