$SETTAG = ":?/START/*\SET\!:"

function SourceCmd($cmd_path) {
    ImportEnv(GetCmdSet($cmd_path))
}

function GetCmdSet($cmd_path) {
    $content = cmd /c "`"$cmd_path`"&echo $SETTAG&set" | ForEach-Object { $_ }
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