."$PSScriptRoot/bridge.ps1"
# SourceCmd(".\example_setvar.bat", "")
$var = SourceCmd("A:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat", "")
ImportEnv($var)
# &"$PSScriptRoot/import_env.ps1"

# Set-Location "C:\Users\13439\Downloads\Compressed\7z2104-src"
# foreach ($folder in Get-ChildItem -Directory -Recurse) {
#     Set-Location $folder
#     nmake.exe clean
# }