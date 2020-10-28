# $Script = Invoke-WebRequest https://raw.githubusercontent.com/gaoljie/system-config/master/win_install.ps1
# Invoke-Expression $($Script.Content)

# install wsl2
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2

$env:SCOOP='D:\Applications\Scoop'
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')

$env:SCOOP_GLOBAL='D:\Applications'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')

Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# run the installer
iwr -useb get.scoop.sh | iex

scoop install git
scoop bucket add extras

scoop install dismplusplus
# scoop install webstorm insomnia notion slack vscode webtorrent potplayer quicklook snipaste