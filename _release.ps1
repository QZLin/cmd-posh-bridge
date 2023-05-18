Push-Location $PSScriptRoot

Remove-Item release -Recurse -ErrorAction Ignore
New-Item release -ItemType Directory
Copy-Item cmd-posh-bridge.* release
Copy-Item LICENSE release
Copy-Item README.md release

Pop-Location

<# https://github.com/PowerShell/PowerShellGetv2/issues/606#issuecomment-906652159
Install-Module PowerShellGet -AllowPrerelease -Repository PSGallery -Force
Import-Module PowerShellGet
Publish-PSResource -path release -apikey ***
#>