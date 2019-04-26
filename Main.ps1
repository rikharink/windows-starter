#--- Setup ---
Disable-UAC
Disable-MicrosoftUpdate

Disable-BingSearch
Disable-GameBarTips
Set-TaskbarOptions -Size Small -Lock -Dock Bottom -Combine Always -AlwaysShowIconsOff

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts/helpers"
Write-Host "helper script base URI is $helperUri"
function executeScript {
    Param ([string]$script)
    Write-Host "executing $helperUri/$script ..."
    Invoke-Expression ((New-Object net.webclient).DownloadString("$helperUri/$script"))
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
