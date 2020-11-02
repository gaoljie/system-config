# $Script = Invoke-WebRequest https://raw.githubusercontent.com/gaoljie/system-config/master/win_install.ps1
# Invoke-Expression $($Script.Content)

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install mysql redis cygwin cyg-get -y

Set-ExecutionPolicy RemoteSigned -scope CurrentUser

iwr -useb get.scoop.sh | iex

scoop install git
scoop bucket add extras

scoop install nvm python
scoop install googlechrome webstorm vscode quicklook snipaste autohotkey

scoop install insomnia notion slack webtorrent potplayer

sc.exe create Redis binpath="C:\Users\jay\scoop\apps\redis\current\redis-server.exe"