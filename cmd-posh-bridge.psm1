$uuid = "59985486-5787-4770-9b23-da9182e660b7"
$SETTAG = ":?/START/*$uuid\SET\!:"
# UUID should be unique, consider to generate a new uuid if you folk this repo

function Import-CmdEnv() {
    [CmdletBinding()]
    Param(
        [string]$CmdPath
    )
    $content = GetCmdSet($CmdPath)
    ImportCmdEnv($content) | Out-Null
}

function GetCmdSet($CmdPath) {
    $content = cmd /c "`"$CmdPath`"&echo.&echo $SETTAG&set"
    Write-Verbose (Join-String -InputObject $content -Separator "`n")
    $content = $content[([Array]::LastIndexOf($content, $SETTAG) + 1)..$content.Length]
    return $content
}

function ImportCmdEnv($psenv) {
    Push-Location Env:
    foreach ($line in $psenv) {
        if ($line -Match '(.*?)=(.*)') {} else { continue }
        $name = $Matches[1]
        $value = $Matches[2]
        Set-Content -Path $name -Value $value
    }
    Pop-Location
}
Export-ModuleMember -Function Import-CmdEnv
