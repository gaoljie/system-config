# & "C:\PATH\TO\SCRIPT\first_script.ps1"

$env:SCOOP='D:\Applications\Scoop'
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
# run the installer
iwr -useb get.scoop.sh | iex
scoop bucket add extras
scoop install dismplusplus