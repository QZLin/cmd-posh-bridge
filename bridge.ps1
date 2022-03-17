$uuid = "a43a29ee91695e1e8608a56e66b84cab"
$SETTAG = ":?/START/*$uuid\SET\!:"
# UUID should be unique, consider to generate a new uuid if you folk this repo

function SourceCmd() {
    [CmdletBinding()]
    Param(
        [string]$CmdPath
    )
    GetCmdSet($CmdPath)
    return
}

function GetCmdSet($CmdPath) {
    $content = cmd /c "`"$CmdPath`"&echo $SETTAG&set" | ForEach-Object { $_ }
    Write-Verbose (Join-String -InputObject $content -Separator "`n")
    $content = $content[([Array]::LastIndexOf($content, $SETTAG) + 1)..$content.Length]
    return $content
}

function ImportEnv($psenv) {
    Push-Location Env:
    foreach ($line in $psenv) {
        if ($line -Match '(.*?)=(.*)') {} else { continue }
        $name = $Matches[1]
        $value = $Matches[2]
        Set-Content -Path $name -Value $value
    }
    Pop-Location
}