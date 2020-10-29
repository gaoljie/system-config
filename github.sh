#sh -c "$(curl -fsSL https://raw.githubusercontent.com/gaoljie/system-config/master/github.sh)"
cd /mnt/d
mkdir Github
cd Github
mkdir helloyumi
CNTX=users; NAME=gaoljie; PAGE=1
curl "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100" |
  grep -e 'git_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone

cd helloyumi
CNTX=orgs; NAME=helloyumi; PAGE=1
curl "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100" |
  grep -e 'git_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone