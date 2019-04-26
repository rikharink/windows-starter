function Show-Menu {
    Param
    (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $Prompt,
        [Parameter(Mandatory = $true, Position = 1)]
        [Object[]] $Options
    )
    $i = 1
    Write-Host "$Prompt`n"
    ForEach-Object -InputObject $Options {
        Write-Host "$i) $_"
        $i++
    }
    do {
        $answer = Read-Host -Prompt "Choice"
        $choice = [convert]::ToInt32($answer, 10)
    } while ($choice -lt 1 -or $choice -gt $i - 1)
    return $Options[$choice - 1]
}