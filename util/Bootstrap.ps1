function Install-Boxstarter {
    if (-Not (Get-Module -ListAvailable -Name Boxstarter.Chocolatey)) {
        Write-Host "Bootstrapping boxstarter..."
        Set-ExecutionPolicy Unrestricted -Force
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        Invoke-Expression $env:ALLUSERSPROFILE\chocolatey\bin\RefreshEnv
        choco install -y boxstarter
        RefreshEnv
        Import-Module Boxstarter.Chocolatey
    }
    else {
        Write-Host "Boxstarter is already installed!"
    }
}