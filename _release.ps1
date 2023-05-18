Push-Location $PSScriptRoot

Remove-Item release -Recurse
New-Item release -ItemType Directory
Copy-Item cmd-posh-bridge.* release
Copy-Item LICENSE release
Copy-Item README.md release

Pop-Location