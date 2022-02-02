
func
Push-Location Env:
foreach ($line in $psenv) {
    if ($line -Match '(.*?)=(.*)') {} else { continue }
    $name = $Matches[1]
    $value = $Matches[2]
    Set-Content -Path $name -Value $value
}
Pop-Location