export EDITOR=vim
export BUNDLER_EDITOR=vim

alias vi='vim'
alias v='vim'
co() {
  if [ -z "$1" ]; then
    code .
  else
    code $1
  fi
}
