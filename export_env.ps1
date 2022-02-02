$out = New-Object System.Collections.Generic.List[string]
foreach ($x in Get-ChildItem env:) {
    $out += $x.Key + "=" + $x.Value
}
$out = Join-String -InputObject $out -Separator "`n"
$out > .tmp.psenv
# Write-Output $out