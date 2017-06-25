myip() {
  ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'
}
alias rmrf='rm -rf'
alias retag='ctags -R --exclude=.git --exclude=log --exclude=tmp --exclude=.js'
alias va='vagrant'
alias l='ls -hla'
alias la='ls -hal'
alias u='cd .. && ls -lha'
alias s='ssh'
alias edithosts='sudo vi /etc/hosts'
alias reloadhosts='dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias npr='npm run -s'
alias es="exec $SHELL"
sshconfig() {
  $EDITOR ~/.ssh/config
}

cl()
{
  builtin cd $1
  ls -hla
}

c()
{
  builtin cd $1
  ls -hla
}

mc()
{
  mkdir $1
  cd $1
  ls -hla
}

tophistory()
{
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
