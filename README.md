# CMD Powershell Bridge
Import environment variable to powershell from cmd/bat script

## Structure

Bridge will try to execute cmd/bat script, then set env variables for powershell

**Caution**: Only import your trusted script, malicious scripts will harm you pc

## Usage

### Install
Module is available at PowerShell Gallery
```powershell
Install-Module -Name cmd-posh-bridge
```

### Example:
```powershell
Import-Module cmd-posh-bridge
Import-CmdEnv "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
```
