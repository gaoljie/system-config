# $Script = Invoke-WebRequest https://raw.githubusercontent.com/gaoljie/system-config/master/win_install.ps1
# Invoke-Expression $($Script.Content)

$env:SCOOP='D:\Applications\Scoop'
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')

$env:SCOOP_GLOBAL='D:\Applications'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')

# run the installer
iwr -useb get.scoop.sh | iex
scoop bucket add extras

scoop install dismplusplus webstorm googlechrome insomnia notion slack vscode webtorrent