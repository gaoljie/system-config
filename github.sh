#sh -c "$(curl -fsSL https://raw.githubusercontent.com/gaoljie/system-config/master/github.sh)"
read GITHUB_API_TOKEN
cd /mnt/d
mkdir Github
cd Github
curl "https://api.github.com/users/gaoljie/repos?per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone
cd /mnt/c/Users/jay
mkdir yumi
cd yumi
curl "https://api.github.com/orgs/helloyumi/repos?access_token=$GITHUB_API_TOKEN&per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone