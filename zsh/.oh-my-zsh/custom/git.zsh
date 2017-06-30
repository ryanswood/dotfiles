RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
COLOR_RESET=$(tput sgr0)

say() {
  echo -e "${2:-$YELLOW}$1${COLOR_RESET}"
}

alias gnit='git init'
alias g='git'
alias gote='git remote'
alias gach='git branch'
alias gacha='git branch -a'
alias gachd='git branch -D'
gadd() {
  if [ -z "$1" ]; then
    stage='.'
  else
    stage="$1"
  fi
  git add $stage
}
alias gs='git status'
alias gl='git log'
alias glop='git log -p'
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(blue)%ci%C(reset) %s %C(blue)[%cn]%C(reset)"'
alias gush='git push'
alias gushf='git push -f'
alias gull='git pull'
alias gech='git fetch'
alias gone='git clone'
gonc() {
  repo_url=$1
  if [ -z "$2" ]; then
    repo_name_with_git="${repo_url##*/}"
    directory_name=${repo_name_with_git%.git}
  else
    directory_name="$2"
  fi
  git clone $repo_url $directory_name && cd $directory_name
}
gout() {
  if [ -z "$1" ]; then
    branches=($(git for-each-ref --format='%(refname:short)' refs/heads/))
    say 'Which branch do you want?'
    for ((i = 1; i < ${#branches[@]}+1; ++i)); do
      echo "$i) ${branches[$i]}"
    done
    printf "› "
    read branch_num
    branch="${branches[$branch_num]}"
  else
    branch="$1"
  fi
  git checkout $branch
}
alias goum='git checkout master'
alias goub='git checkout -b'
alias gc='gac'
gac() {
  stage_all_if_none_staged
  if [ -z "$1" ]; then
    message=''
  else
    message="-m $1"
  fi
  git commit $message
}
gend() {
  stage_all_if_none_staged
  git commit --amend --no-edit
}
alias gres='git reset'
alias gresha='git reset --hard'
greshe() {
  if [ -z "$1" ]; then
    num=1
  else
    num="$1"
  fi
  git reset head~$num
}
gsho() {
  if [ -z "$1" ]; then
    sha=$(git rev-parse HEAD)
  else
    sha="$1"
  fi
  git show $sha
}
alias gase='git rebase'
gasi() {
  if [ -z "$1" ]; then
    number='5'
  else
    number="$1"
  fi
  git rebase -i head~$number
}
alias gasc='git rebase --continue'
stage_all_if_none_staged() {
  git status | grep -q 'Changes to be committed'
  if [[ $? -eq 1 ]] ; then
    git add .
  fi
}
gwip() {
  stage_all_if_none_staged
  if [ -z "$1" ]; then
    message='wip'
  else
    message="wip: $1"
  fi
  git commit -m $message
}
alias gash='git stash -u'
alias gpop='git stash pop'
alias giff='git diff'
alias gifs='dit diff --staged'
alias gerg='git merge'
alias gref='git reflog'
alias gean='git clean -df'
alias gonf='git config'
alias gick='git cherry-pick'
