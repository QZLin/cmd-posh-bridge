$uuid = "59985486-5787-4770-9b23-da9182e660b7"
# UUID should be unique, consider to generate a new uuid if you folk this repo

function Import-CmdEnv() {
    [CmdletBinding()]
    Param(
        [string]$CmdPath
    )
    $c = get_cmd_set($CmdPath)
    import_env($c) | Out-Null
}

function get_cmd_set($CmdPath) {
    $file = Get-Item $CmdPath -ErrorAction Stop
    $output = cmd /Q /C "`"$($file.FullName)`" & echo. & echo $uuid & set"
    Write-Verbose (Join-String -InputObject $output -Separator "`n")
    $output = $output[([Array]::LastIndexOf($output, $uuid) + 1)..$output.Length]
    return $output
}

function import_env($env_str) {
    Push-Location Env:
    foreach ($line in $env_str) {
        if ($line -Match '^(.*?)=(.*)$') {} else { continue }
        $name = $Matches[1]
        $value = $Matches[2]
        Set-Content -Path $name -Value $value
    }
    Pop-Location
}
Export-ModuleMember -Function Import-CmdEnv
