#sh -c "$(curl -fsSL https://raw.githubusercontent.com/gaoljie/system-config/master/github.sh)"
cd ~
mkdir Repos
cd Repos
mkdir gaoljie
cd gaoljie
curl -s -H "Authorization: token TOKEN" "https://api.github.com/users/gaoljie/repos?&per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone
cd ~/Repos
mkdir yumi
cd yumi
curl -s -H "Authorization: token TOKEN" "https://api.github.com/orgs/helloyumi/repos?&per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone