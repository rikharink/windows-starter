. .\util\Logo.ps1
. .\util\ShowMenu.ps1
. .\util\Bootstrap.ps1
. .\util\Admin.ps1

Clear-Host
Show-Logo
if (-Not (Get-IsAdmin)) {
    Write-Host "Sorry, this script needs to be run as an administrator to work"
}
else {
    Install-Boxstarter
    $options = Get-ChildItem ".\scripts\recipes" -Filter "*.ps1"
    $choice = Show-Menu -Prompt "Which recipe would you like to run?" -Options $options
    Write-Host "Executing $choice"
    $recipe = (Get-Item -Path ".\scripts\recipes\$choice").FullName
    Write-Host $recipe
    #Install-BoxstarterPackage $recipe
}