$SETTAG = "::/START*SET\::"

function SourceCmd($cmd_path, $args_) {
    $content = cmd /c "`"$cmd_path`"&echo $SETTAG&set" | ForEach-Object { $_ }
    $content = $content[([Array]::LastIndexOf($content,$SETTAG)+1)..$content.Length]
    return $content
    <#   $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName = "cmd.exe"
    $pinfo.RedirectStandardError = $true
    $pinfo.RedirectStandardOutput = $true
    $pinfo.UseShellExecute = $false
    $pinfo.Arguments = "/c", "call `"$cmd_path`" & pwsh -command `"$PSScriptRoot\export_env.ps1`""
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null
    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()
    $p.WaitForExit()
    Write-Host "stdout: $stdout"
    Write-Host "stderr: $stderr"
    Write-Host "exit code: " + $p.ExitCode

    Start-Process "cmd.exe" -ArgumentList "/c", "call `"$cmd_path`" & pwsh -command `"echo hi`"" -WorkingDirectory $(Get-Location) #>
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